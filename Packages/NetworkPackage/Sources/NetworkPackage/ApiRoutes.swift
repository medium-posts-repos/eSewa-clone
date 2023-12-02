//
//  File.swift
//  
//
//  Created by swornim-shah on 02/10/2023.
//

import Alamofire
import DomainPackage
import Foundation

public struct ApiRoutes {
    public var url: String = RouteProvider.BASE_URL
    
    public var getUrl: URL {
        get {
            URL(string: url)!
        }
    }
    
    public init() {}
    
    public func encodingFrom(method: HTTPMethod) -> ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    public func asURLRequest(url: String? = nil, method: HTTPMethod, parameters: Parameters) -> URLRequest {
        do {
            let completeUrl = try (url ?? self.url).asURL()
            
            var urlRequest = URLRequest(url: completeUrl)
            
            /*Common json headers*/
            urlRequest.setValue(NetworkConstants.ContentType.json.rawValue, forHTTPHeaderField: NetworkConstants.HttpHeaderField.acceptType.rawValue)
            urlRequest.setValue(NetworkConstants.ContentType.json.rawValue, forHTTPHeaderField: NetworkConstants.HttpHeaderField.contentType.rawValue)
            
            urlRequest.method = method
            
            return try encodingFrom(method: method).encode(urlRequest, with: parameters)

        } catch {
            //TODO Make logger
            return URLRequest(url: URL(string: "")!)
        }
    }
}
