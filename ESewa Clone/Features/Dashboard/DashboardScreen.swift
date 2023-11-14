//
//  DashboardScreen.swift
//  ESewa Clone
//
//  Created by swornim-shah on 12/11/2023.
//

import SwiftUI

public struct DashboardScreen: View {
    
    @EnvironmentObject var router: Router

    @State private var selectedTab = 0
    @State private var onSelectedTab = 0

    public var body: some View {
        VStack {
            TabView(selection:$selectedTab) {
                renderTabScreen()
            }.onChange(of: selectedTab) { index in
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
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Statement")
                    }
                default:
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Text("More")
                    }
                }
            }
        }.edgesIgnoringSafeArea(.bottom)
    }
    
    @ViewBuilder
    private func renderTabScreen() -> some View {
        HomeScreen()
            .tabItem({
                Image(systemName: "house")
            })
            .tabItem { Text("Home") }
            .tag(0)
        
            StatementScreen()
                .tabItem({
                    Image(systemName: "bell")
                })
                .tabItem { Text("Statement") }
                .tag(1)
        
        StatementScreen()
            .tabItem({
                Image(systemName: "text.bubble")
            })
            .tabItem { Text("Support") }
            .tag(2)
        
        SupportScreen()
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
        router.route(menu: .init(routeCode: RouteCodeNavigator.ROUTE_PRIVATE_PROFILE))
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
