//
//  DashboardScreen.swift
//  ESewa Clone
//
//  Created by swornim-shah on 12/11/2023.
//

import SwiftUI
import DomainPackage

public struct DashboardScreen: View {
    
    @EnvironmentObject var router: Router
    @EnvironmentObject var theme: ThemeManager

    @State private var selectedTab = 0
    @State private var onSelectedTab = 0

    public var body: some View {
        VStack {
            TabView(selection:$selectedTab) {
                renderTabScreen()
                    .background(theme.currentTheme.backgroundColor)
            }
            .onChange(of: selectedTab) { index in
                print("Tab selected \(index)")
                onSelectedTab = index
            }.toolbar {
                switch onSelectedTab {
                case 0:
                    HomeToolbarView(onProfileTapped: onProfileTapped)
                case 1:
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Notification")
                    }
                case 2:
                    ToolbarItem(placement: .principal) {
                        Text("Help and Support")
                    }
                default:
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Text("More")
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func homeScreen() -> some View {
        HomeScreen(router: router)
            .tabItem({
                Image(systemName: "house")
            })
            .tabItem { Text("Home") }
            .tag(0)
    }
    
    @ViewBuilder
    func statementScreen() -> some View {
        StatementScreen()
            .tabItem({
                Image(systemName: "text.bubble")
            })
            .tabItem { Text("Statement") }
            .tag(0)
    }
    
    @ViewBuilder
    private func renderTabScreen() -> some View {
        homeScreen()
        statementScreen()
        
        HelpAndSupportScreen()
            .tabItem({
                Image(systemName: "bell")
            })
            .tabItem { Text("Help and Support") }
            .tag(2)
        
        MoreScreen()
            .tabItem({
                Image(systemName: "qrcode")
            })
            .tabItem { Text("More") }
            .tag(3)
    }
}

// MARK: view events
extension DashboardScreen {
    func onProfileTapped() {
        router.route(menu: RouteIntentDto(routeCode: RouteCodeNavigator.ROUTE_PRIVATE_PROFILE))
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
