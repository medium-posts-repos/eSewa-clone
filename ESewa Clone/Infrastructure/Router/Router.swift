//
//  Router.swift
//  SnapBank
//
//  Created by swornim-shah on 27/09/2023.
//

import SwiftUI

public protocol RoutableIntentProtocol: Hashable {
    var routeCode: String? { get set }
}

public struct RouteDestination: RoutableIntentProtocol, Codable {
    public var routeCode: String?
}

public class Router: ObservableObject {
    
    @Published var navPath = NavigationRoutePath()

    @ViewBuilder
    func buildNavigationStack(destination: RouteDestination) -> some View {
        switch destination.routeCode {
        case RouteCodeNavigator.ROUTE_PRIVATE_PROFILE:
            EmptyView()
        case RouteCodeNavigator.ROUTE_NOTIFICATION:
            EmptyView()
        case RouteCodeNavigator.ROUTE_DASHBOARD:
            EmptyView()
                .navigationTitle("Snap Paisa")
                .navigationBarBackButtonHidden()
        default:
            EmptyView()
        }
    }
}

/* route to specific controllers */
extension Router {
    
    public func route(menu: RouteDestination) {
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
