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
        Task { @MainActor [weak self] in
//            do {
                let formFields = await FormData().build(menu: formMenu.routeMenu)
                var updatedFormMenu = formMenu
                updatedFormMenu.formFields = formFields
                self?.route(formMenu: updatedFormMenu)
//            } catch let error {
//                print("Error \(error)")
//            }
        }.store(in: &cancellables)
        
        // approaches for async calls and task cancellations
        // 1. &cancellables(recommended)
        // 2. use global var task: Task<Void, Never>? for simple usecases
    }
}
