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
            SuccessFormScreen(response: destination.response)
                .navigationTitle("Transaction Success")
                .navigationBarBackButtonHidden(true)
        case MenuConstants.MERCHANT_FAILURE_ROUTE:
            SuccessFormScreen()
        default:
            SuccessFormScreen()
        }
    }
    
    @ViewBuilder
    func buildMerchantConfirmationRouter(destination: MerchantRouteConfirmationIntent) -> some View {
        GenericConfirmationVc(targetMenu: destination.targetMenu) {
            self.route(menu: $0)
        }.navigationTitle("Confirmation")
    }
}
