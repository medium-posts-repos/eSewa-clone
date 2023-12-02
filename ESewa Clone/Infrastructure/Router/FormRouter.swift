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
    func routeFormHandler(formMenu: RouteDestination) {
        formBuilder(formMenu: formMenu)
    }
    
    private func route(formMenu: RouteDestination) {
        navPath.append(formMenu)
    }
    
    @ViewBuilder
    func buildFormRouteDestination(destination: RouteDestination) -> some View {
        switch destination.routingCode {
        case MenuConstants.ELECTRICITY:
            GenericFormScreen(formFields: destination.formFields ?? [])
                .navigationTitle(destination.routingTitle ?? "")
        default:
           EmptyView()
        }
    }
    
    func formBuilder(formMenu: RouteDestination) {
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
