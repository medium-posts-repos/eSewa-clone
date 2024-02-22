//
//  ESewa_CloneApp.swift
//  ESewa Clone
//
//  Created by swornim-shah on 12/11/2023.
//

import SwiftUI
import FormPackage

@main
struct ESewaApp: App {
    
   // @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    @AppStorage("isAuthenticated") private var isAuthenticated = true
    
    @ObservedObject var router = Router()
    
    private var routeDashboard: RouteIntentDto {
        var menu = RouteIntentDto()
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
                        
                    }
                }
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: RouteIntentDto.self) { destination in
                    router.buildNavigationStack(destination: destination)
                }
            }
            .environmentObject(router)
            .environment(\.colorScheme, .dark)
        }
    }
}
