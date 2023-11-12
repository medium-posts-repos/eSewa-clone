//
//  RouteViewExt.swift
//  SnapBank
//
//  Created by swornim-shah on 28/09/2023.
//

import SwiftUI

public extension View {
    func setupRouteDestination() -> some View {
            navigationDestination(for: RouteDestination.self) { destination in
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
}
