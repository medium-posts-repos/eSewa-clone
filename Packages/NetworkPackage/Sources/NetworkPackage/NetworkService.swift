////
////  NetworkService.swift
////  Snapkatha
////
////  Created by swornim-shah on 18/03/2022.
////
//
import Alamofire
import Combine
import RxSwift
import Foundation
import DomainPackage

public extension Result {

    var offline: Failure? {
        guard case let .failure(error) = self else { return nil }
        return error
    }
}

public struct ApiModel: Codable {
    public init() {}
}

public class NetworkService: NetworkServiceProtocol {
    
    private var extraHeaders: RequestParams {
        get {
            return [
                "Accept": "application/json",
                "Content-Type": "application/json"
            ]
        }
    }
        
    private lazy var sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.allowsCellularAccess = false
        configuration.timeoutIntervalForRequest =  60
        configuration.timeoutIntervalForResource = 60
        configuration.httpAdditionalHeaders = extraHeaders
        
        let session = Session(configuration: configuration)
        return session
    }()
    
    @available(iOS 13.0, *)
    public func aSyncCall<T>(request: URLConvertible, model: T.Type, method: HTTPMethod = .post, params: RequestParams? = nil) -> AnyPublisher<T, Error> where T : Decodable, T : Encodable {
        let customHeaders: [String: String] = [
            ApiConstants.AUTHORIZATION: "Bearer \(AppSessionStore.shared.sessionToken ?? "")"
        ]
        
        do {
            let url = try request.asURL().absoluteString
            AppLogger.d("\(method.rawValue) => \(url)\n")
            if let _params = params  {
                AppLogger.d("\(_params)\n\(customHeaders)\n")
            }
        } catch {
            
        }
    
        let encoding: ParameterEncoding = method == .get ? URLEncoding(destination: .queryString) : JSONEncoding.default
        return sessionManager
            .request(request, method: method, parameters: params, encoding: encoding, headers: .init(customHeaders))
            .publishData()
            .tryMap ({ response in
                
                guard let httpRes = response.response, httpRes.statusCode >= 200 && httpRes.statusCode <= 300 else {
                    throw NSError(domain: "STATUS_RANGE_FAILED", code: 0)
                }
                
                // Deserialize the response data to your model type
                guard let data = response.data else {
                    throw NSError(domain: "Response Data is Null ", code: 0)
                }
            
                let decodedModel = try JSONDecoder().decode(model.self, from: data)
                AppLogger.d("\n\(method.rawValue) <= \(response.request?.url?.absoluteString ?? "") \("\n") \(data.toPreetyString() ?? "Invalid JSON")")
            
                switch response.result {
                case .success:
                    return decodedModel
                case .failure(let error):
                    throw error
                }
            })
            .mapError { error in
                AppLogger.d("\nIncoming response error: \(error.localizedDescription)")

                if let error = error as? AFError {
                    return error
                } else {
                    return NSError(domain: "", code: 0)
                }
            }
            .eraseToAnyPublisher()
    }

    private lazy var networkApiMonitor = NetworkApiMonitor()

    public static let instance: NetworkServiceProtocol = {
        var service = NetworkService()
        return service
    }()

//    @available(iOS 13.0, *)
//    public func post<T: Codable>(request: URLConvertible, model: T.Type, completion: @escaping (Result<T, AFError>) -> Void) -> AnyPublisher<T, Error> {
//
//        let requestPublisher = sessionManager.request(request).publishDecodable(type: T.self)
//
//        let cancellable = requestPublisher
//            .subscribe(on: DispatchQueue(label: "Background Queue", qos: .background))
//            .receive(on: DispatchQueue.main)
//            .sink { result in
//                if let value = result.value {
//                    completion(Result.success(value))
//                } else if let error = result.error {
//                    completion(Result.failure(error))
//                }
//            }
//        return cancellable
//    }

    @available(iOS 13.0, *)
    public func post<T: Codable>(request: URLConvertible, params: Parameters, model: T.Type) async throws -> T {
        try await withUnsafeThrowingContinuation { continuation in

            let requestPublisher = sessionManager.request(request).publishDecodable(type: model.self)

            let _ = requestPublisher
                .subscribe(on: DispatchQueue(label: "Background Queue", qos: .background))
                .receive(on: DispatchQueue.main)
                .sink { result in
                    if let value = result.value {
                        continuation.resume(with: Result.success(value))
                    } else if let error = result.error {
                        continuation.resume(throwing: error)
                    }
                }
        }
    }

    public func post<T>(url: String, model: T.Type) -> Observable<T> where T : Decodable, T : Encodable {
        return Observable.create { observer in
            self.sessionManager.request(url).responseDecodable(of:  T.self) { response in
                switch response.result {
                case .success(let response):
                    observer.onNext(response)
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
            return Disposables.create()
        }
    }
}
