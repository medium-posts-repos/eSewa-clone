//
//  RouteRegistry.swift
//  ESewa Clone
//
//  Created by swornim-shah on 21/03/2025.
//

import SwiftUI

public struct RouteRegistry {
    
   // ✅  Closure for dynamic instantiation
    public static var routes: [String: () -> AnyView] = [
        RouteCodeNavigator.ROUTE_DASHBOARD: { AnyView(DashboardScreen()) }
    ]
}
