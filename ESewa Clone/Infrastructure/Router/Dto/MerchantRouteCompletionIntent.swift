//
//  MerchantRouteCompletionIntent.swift
//  ESewa Clone
//
//  Created by swornim-shah on 07/03/2024.
//

import DomainPackage

public struct MerchantRouteCompletionIntent: RoutableIntentProtocol {

    public var targetMenu: MenuModel?
    public var routeCode: String?
    public var response: MerchantResponseDto?
    
    public init(targetMenu: MenuModel? = nil, routeCode: String?) {
        self.targetMenu = targetMenu
        self.routeCode = routeCode
    }
    
}

public struct MerchantRouteConfirmationIntent: RoutableIntentProtocol {
    
    public var targetMenu: MenuModel?
    public var routeCode: String?
    
    public init(targetMenu: MenuModel? = nil, routeCode: String?) {
        self.targetMenu = targetMenu
        self.routeCode = routeCode
    }
}
