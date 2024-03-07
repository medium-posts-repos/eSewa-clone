//
//  MerchantRouter.swift
//  ESewa Clone
//
//  Created by swornim-shah on 07/03/2024.
//

import DomainPackage
import SwiftUI

// MARK: merchant router
extension Router {
    
    public func route(menu: MerchantRouteCompletionIntent) {
        navPath.append(menu)
    }
    
    public func route(menu: MerchantRouteConfirmationIntent) {
        navPath.append(menu)
    }
    
    @ViewBuilder
    func buildMerchantCompletionRouter(destination: MerchantRouteCompletionIntent) -> some View {
        switch destination.routeCode {
        case MenuConstants.MERCHANT_SUCCESS_ROUTE:
            SuccessFormScreen().onAppear {
                print("Incoming success \(destination.routeCode ?? "")")
            }
        case MenuConstants.MERCHANT_FAILURE_ROUTE:
            SuccessFormScreen()
        default:
            SuccessFormScreen()
        }
    }
    
    @ViewBuilder
    func buildMerchantConfirmationRouter(destination: MerchantRouteConfirmationIntent) -> some View {
        GenericConfirmationVc(targetMenu: destination.targetMenu) {
            var successIntent = MerchantRouteCompletionIntent(targetMenu: destination.targetMenu, routeCode: MenuConstants.MERCHANT_SUCCESS_ROUTE)
            successIntent.response = $0
            self.route(menu: successIntent)
        }.navigationTitle("Confirmation")
    }
}
