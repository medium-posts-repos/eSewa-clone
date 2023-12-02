//
//  NetworkServiceProtocal.swift
//  Created by swornim-shah on 17/03/2023.
//

import Alamofire
import Combine
import RxSwift
import DomainPackage

public protocol NetworkServiceProtocol: AnyObject {
    @available(iOS 13.0, *)
    func aSyncCall<T: Codable>(request: URLConvertible, model: T.Type, method: HTTPMethod, params: RequestParams?) -> AnyPublisher<T, Error>
           
    @available(iOS 13.0, *)
    func post<T: Codable>(request: URLConvertible, params: Parameters, model: T.Type) async throws -> T
}
