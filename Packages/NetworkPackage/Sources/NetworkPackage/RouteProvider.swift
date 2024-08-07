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
        RouteConstants.ROUTE_ELECTRICITY: "form/electricity",
        RouteConstants.ACCOUNT_STATEMENTS: "account/statements",
        RouteConstants.KHANE_PANI_PAYMENT: "merchant/payment/khanepani",
    ]
    
    public func routeFrom(routeCode: String) -> ApiRoutes {
        var apiRoute = ApiRoutes()
        
        if let url = authRoutes[routeCode] {
            apiRoute.url = RouteProvider.BASE_URL + url
            return apiRoute
        }
        
        apiRoute.url = RouteProvider.BASE_URL + "payment"
        
        return apiRoute
    }
}
