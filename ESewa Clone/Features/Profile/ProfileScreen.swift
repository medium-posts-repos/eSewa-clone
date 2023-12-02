//
//  ProfileScreen.swift
//  ESewa Clone
//
//  Created by swornim-shah on 13/11/2023.
//

import SwiftUI
import DomainPackage

public struct ProfileScreen: View {
    public var body: some View {
        List {
            Section {
                ProfileHeaderView()
                    .modifier(MenuShapeViewModifier())
            }
            .listRowSeparator(.hidden)
            
            Section {
                ProfileBalancePointsView()
                    .modifier(MenuShapeViewModifier())
            }.listRowSeparator(.hidden)
            
            Section {
                MenuIconDescListView(menus: MenuModel.dashboardMenus, spacing: 20)
                    .frame(maxWidth: .infinity)
                    .modifier(MenuShapeViewModifier())
            }.listRowSeparator(.hidden)
            
        }.listStyle(.plain)
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
            }
    }
}

public struct ProfileHeaderView: View {
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
            }.foregroundColor(.green)
            
            VStack {
                Text("Swornim Bikram Shah")
                Text("9813847444")
                Button(action: {}) {
                    HStack {
                        Image(systemName: "house.fill")
                            .toNavigationIcon()
                        Text("Active")
                    }.modifier(MenuShapeViewModifier(padding: 8))
                    
                }.foregroundColor(.green)
            }
        }.frame(maxWidth: .infinity)
    }
}

public struct ProfileBalancePointsView: View {
    public var body: some View {
        HStack(alignment: .center, spacing: 18) {
            Image(systemName: "house.fill")
                .toNavigationIcon()
            
            VStack(alignment: .leading) {
                Text("NPR XXXX.XX")
                Text("Wallet Balance")
            }
            
            Rectangle()
                .cornerRadius(2)
                .frame(width: 2, height: 32)
                .foregroundColor(.white)
            
            Image(systemName: "house.fill")
                .toNavigationIcon()
            
            VStack(alignment: .leading) {
                Text("XXXX.XXX")
                Text("Reward Points")
            }
        }.frame(maxWidth: .infinity)
    }
}
