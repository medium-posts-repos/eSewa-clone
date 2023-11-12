//
//  ESewa_CloneApp.swift
//  ESewa Clone
//
//  Created by swornim-shah on 12/11/2023.
//

import SwiftUI

@main
struct ESewaApp: App {
    @AppStorage("isAuthenticated") private var isAuthenticated = false
    
    @ObservedObject var router = Router()
    
    private var routeDashboard: RouteDestination {
        var menu = RouteDestination()
        menu.routeCode = RouteCodeNavigator.ROUTE_DASHBOARD
        return menu
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath.path) {
                Group {
                    if isAuthenticated {
                        Rectangle().hidden().onAppear {
                            router.route(menu: routeDashboard)
                        }
                        
                    } else {
                        DashboardScreen()
                        //                        {
                        //                            var dashboardDest = RouteDestination()
                        //                            dashboardDest.routeCode = RouteCodeNavigator.ROUTE_DASHBOARD
                        //                            router.route(menu: dashboardDest)
                        //                        }
                        // .navigationTitle("Login")
                    }
                }
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: RouteDestination.self) { destination in
                    router.buildNavigationStack(destination: destination)
                }
            }
            .environmentObject(router)
            .environment(\.colorScheme, .dark)
        }
    }
}
