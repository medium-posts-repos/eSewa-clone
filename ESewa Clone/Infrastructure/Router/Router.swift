//
//  Router.swift
//  SnapBank
//
//  Created by swornim-shah on 27/09/2023.
//

import SwiftUI
import DomainPackage
import FormPackage
import Combine

public class Router: ObservableObject {
    
    @Published var navPath = NavigationRoutePath()
    
    public lazy var cancellables: Set<AnyCancellable> = []

    @ViewBuilder
    func buildNavigationStack(destination: RouteDestination) -> some View {
        switch destination.routeCode {
        case RouteCodeNavigator.ROUTE_PRIVATE_PROFILE:
            ProfileScreen()
        case RouteCodeNavigator.ROUTE_NOTIFICATION:
            EmptyView()
        case RouteCodeNavigator.ROUTE_DASHBOARD:
            DashboardScreen()
                .navigationBarBackButtonHidden()
        default:
            buildFormRouteDestination(destination: destination)
        }
    }
}

//MARK: route variations
extension Router {

    public func route(menu: RouteDestination) {
        if routeToFormMiddleware(menu: menu, onNext: { newMenu in
            routeFormHandler(formMenu: newMenu)
        }) { return }
            
        navPath.append(menu)
    }
    
    //pop to screen via `route code`
    public func routeToDashboard() {
        popTo(code: RouteCodeNavigator.ROUTE_DASHBOARD)
    }
    
    //pop to screen via `route code`
    public func popTo(code: String) {
        if let position = navPath.stacks.enumerated().first(where: {
            $0.element.routeCode == code
        })?.offset {
            navPath.removeLast(position)
        }
    }
    
    //pop to screen via `index`
    public func popTo(index: Int) {
        if let position = navPath.stacks.enumerated().first(where: {
            $0.offset == index
        })?.offset {
            navPath.removeLast(position)
        }
    }
    
    public func popToRoot() {
        navPath.path = .init()
    }
}
