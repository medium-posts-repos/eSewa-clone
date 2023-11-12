//
//  DashboardScreen.swift
//  ESewa Clone
//
//  Created by swornim-shah on 12/11/2023.
//

import SwiftUI

public struct DashboardScreen: View {
    @State private var selectedTab = 0
    
    public var body: some View {
        VStack {
            TabView(selection:$selectedTab) {
                renderTabScreen()
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

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
