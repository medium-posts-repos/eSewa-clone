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
    
    @AppStorage("isAuthenticated") private var isAuthenticated = true
    
    @ObservedObject private var themeManager: ThemeManager = ThemeManager.instance
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
                }.navigationDestination(for: MerchantRouteConfirmationIntent.self) { destination in
                    router.buildMerchantConfirmationRouter(destination: destination)
                }.navigationDestination(for: MerchantRouteCompletionIntent.self) { destination in
                    router.buildMerchantCompletionRouter(destination: destination)
                }
            }.preferredColorScheme(themeManager.currentTheme.colorScheme)
            .onAppear {
                let tabBarAppearance = UITabBarAppearance()

                UITabBar.appearance().standardAppearance = tabBarAppearance
            }
            .environmentObject(router)
            .environmentObject(themeManager)
            .environment(\.colorScheme, themeManager.currentTheme.colorScheme)
        }
    }
}
