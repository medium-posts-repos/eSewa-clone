//
//  ProfileScreen.swift
//  ESewa Clone
//
//  Created by swornim-shah on 13/11/2023.
//

import SwiftUI
import DomainPackage

public struct ProfileScreen: BaseView {
    @EnvironmentObject var theme: ThemeManager
    
    @State private var isToggled = false

    public var body: some View {
        List {
            Section {
                ProfileHeaderView()
                    .modifier(MenuShapeViewModifier())
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            
            Section {
                ProfileBalancePointsView()
                    .modifier(MenuShapeViewModifier())
            }.listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            
            Section {
                Toggle("Change Theme", isOn: $isToggled)
                    .foregroundStyle(theme.currentTheme.onSurfaceColor)
                    .onChange(of: isToggled) { newValue in
                        theme.updateTheme(scheme: theme.activeScheme == .dark ? .light : .dark)
                    }
            }.listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            
            Section {
                MenuIconDescListView(menus: MenuModel.dashboardMenus, spacing: 20)
                    .frame(maxWidth: .infinity)
                    .modifier(MenuShapeViewModifier())
            }.listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            
        }.listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(theme.currentTheme.backgroundColor)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "bell.fill")
                        .resizable()
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                        }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "moon.fill")
                        .resizable()
                        .padding(.leading, 16)
                        .foregroundColor(.accentColor)
                }
            }.toolbarBackground(theme.activeScheme == .dark ? .black : .white, for: .navigationBar)
    }
}

public struct ProfileHeaderView: BaseView {
    
    @EnvironmentObject var theme: ThemeManager
    
    public var body: some View {
        VStack(alignment: .center) {
            Image("ic_profile_view")
                .resizable()
                .clipShape(Circle())
                .frame(width: .xLargeSize, height: .xLargeSize)
            Button(action: {}) {
                HStack {
                    Image(systemName: "house.fill")
                        .aspectRatio(contentMode: .fill)
                        .frame(width: .smallSize, height: .smallSize)
                    Text("Verified")
                }
            }.foregroundColor(theme.currentTheme.backgroundColor)
            
            VStack {
                Text("Swornim Bikram Shah")
                    .foregroundColor(theme.currentTheme.onSurfaceColor)

                Text("9813847444")
                    .foregroundColor(theme.currentTheme.onSurfaceColor)

                Button(action: {}) {
                    HStack {
                        Image(systemName: "house.fill")
                            .toNavigationIcon()
                        Text("Active")
                            .foregroundColor(theme.currentTheme.onSurfaceColor)

                    }.modifier(MenuShapeViewModifier(padding: 8))
                    
                }.foregroundColor(theme.currentTheme.backgroundColor)
            }
        }.frame(maxWidth: .infinity)
    }
}

public struct ProfileBalancePointsView: BaseView {
    @EnvironmentObject var theme: ThemeManager

    public var body: some View {
        HStack(alignment: .center, spacing: 18) {
            Image(systemName: "house.fill")
                .toNavigationIcon()
            
            VStack(alignment: .leading) {
                Text("NPR XXXX.XX")
                    .foregroundColor(theme.currentTheme.onSurfaceColor)
                Text("Wallet Balance")
                    .foregroundColor(theme.currentTheme.onSurfaceColor)
            }
            
            Rectangle()
                .cornerRadius(2)
                .frame(width: 2, height: 32)
                .foregroundColor(.white)
            
            Image(systemName: "house.fill")
                .toNavigationIcon()
            
            VStack(alignment: .leading) {
                Text("XXXX.XXX")
                    .foregroundColor(theme.currentTheme.onSurfaceColor)

                Text("Reward Points")
                    .foregroundColor(theme.currentTheme.onSurfaceColor)
            }
        }.frame(maxWidth: .infinity)
    }
}
