//
//  RouteProvider.swift
//  Created by swornim-shah on 02/10/2023.
//

import DomainPackage

public class RouteProvider {
    
    public init() {}
    
    public static let shared = RouteProvider()
    
    public static let BASE_URL = "http://localhost:8000/api/v1/"

    private let authRoutes: [String: String] = [
        "": ""
    ]
    
    public func routeFrom(routeCode: String) -> ApiRoutes {
        var apiRoute = ApiRoutes()
        
        if let url = authRoutes[routeCode] {
            apiRoute.url = RouteProvider.BASE_URL + url
            return apiRoute
        }
        
        return apiRoute
    }
}
