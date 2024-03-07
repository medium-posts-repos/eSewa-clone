//
//  ElectrictyRouter.swift
//  ESewa Clone
//
//  Created by swornim-shah on 22/02/2024.
//

import Foundation
import DomainPackage
import FormPackage
import SwiftUI

public extension Router {
    
    private func routeConfirmation(destination: RouteIntentDto) {
        var confirmDest = destination
        confirmDest.routeCode = MenuConstants.ELECTRICITY_CONFIRM
        self.route(menu: confirmDest)
    }
    
    @ViewBuilder
    func buildElectricityFlowDestination(destination: RouteIntentDto) -> some View {
        switch destination.routingCode {
            
        case MenuConstants.ELECTRICITY:
            GenericFormScreen(formFields: destination.formFields ?? []) { self.routeConfirmation(destination: destination) }
                .navigationTitle(destination.routingTitle ?? "")
        default:
            EmptyView().navigationTitle("Feature not available at the moment")
        }
    }
}
