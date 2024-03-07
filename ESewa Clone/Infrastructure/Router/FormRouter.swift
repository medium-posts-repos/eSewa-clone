//
//  FormRouter.swift
//  ESewa Clone
//
//  Created by swornim-shah on 02/12/2023.
//

import FormPackage
import DomainPackage
import SwiftUI

public extension Router {
    func routeFormHandler(formMenu: RouteIntentDto) {
        formBuilder(formMenu: formMenu)
    }
    
    private func route(formMenu: RouteIntentDto) {
        navPath.append(formMenu)
    }
    
    @ViewBuilder
    func buildFormRouteDestination(destination: RouteIntentDto) -> some View {
        switch destination.routingCode {
        case MenuConstants.ELECTRICITY:
            buildElectricityFlowDestination(destination: destination)
        default:
            GenericFormScreen(formFields: destination.formFields ?? []) {
                self.routeToConfirmation(destination: destination)
            }.navigationTitle(destination.routingTitle ?? "")
        }
    }
    
    private func routeToConfirmation(destination: RouteIntentDto) {
        let confirmationIntent = MerchantRouteConfirmationIntent(targetMenu: destination.routeMenu, routeCode: destination.routeCode)
        self.route(menu: confirmationIntent)
    }
    
    func formBuilder(formMenu: RouteIntentDto) {
        guard let formFields = formMenu.formFields, !formFields.isEmpty else {
            Task { @MainActor [weak self] in
                var updatedFormMenu = formMenu
                let formFields = await FormData().build(menu: formMenu.routeMenu)
                updatedFormMenu.formFields = formFields
                self?.route(formMenu: updatedFormMenu)
            }
            return
        }
        
        route(formMenu: formMenu)
    }
}
