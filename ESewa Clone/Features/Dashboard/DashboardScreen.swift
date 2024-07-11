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
    
    init() {
      
    }
    
    public var body: some View {

        VStack {
            TabView(selection:$selectedTab) {
                renderTabScreen()
                    .background(theme.currentTheme.backgroundColor)
            }
            .onChange(of: selectedTab) { index in
                onSelectedTab = index
            }.toolbar {
                switch onSelectedTab {
                case 0:
                    HomeToolbarView(onProfileTapped: onProfileTapped)
                case 1:
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Notification")
                            .foregroundStyle(theme.currentTheme.onSurfaceColor)
                    }
                case 2:
                    ToolbarItem(placement: .principal) {
                        Text("Help and Support")
                            .foregroundStyle(theme.currentTheme.onSurfaceColor)
                    }
                default:
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Text("More")
                            .foregroundStyle(theme.currentTheme.onSurfaceColor)
                    }
                }
            }
        }.safeAreaInset(edge: .top, content: {
            if theme.activeScheme == .dark {
                ZStack(alignment: .top) {
                    Color.clear
                        .frame(height: 0)
                        .background(.bar)
                }.background(Color.black.opacity(0.5))
            } else {
                ZStack(alignment: .top) {
                    Color.clear
                        .frame(height: 0)
                        .background(.bar)
                }.background(Color.clear)
            }
        })
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
            .toolbarBackground(.hidden, for: .bottomBar)
            .tabItem({
                Image(systemName: "text.bubble")
            })
            .tabItem { Text("Statement") }
            .tag(1)
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
