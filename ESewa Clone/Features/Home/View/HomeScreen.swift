//
//  HomeScreen.swift
//  ESewa Clone
//
//  Created by swornim-shah on 12/11/2023.
//

import SwiftUI

public struct HomeScreen: View {
    
    @EnvironmentObject var router: Router

    private let viewTypes: [HomeScreenViewType] = [
        .primaryMenuView,
        .secondaryMenuView
    ]
    
    public var body: some View {
        NavigationView {
            List {
                ForEach(viewTypes, id: \.self) { each in
                    switch each {
                    case .primaryMenuView:
                        Section {
                            HomePrimaryMenuView()
                        }.listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    case .secondaryMenuView:
                        Section {
                            GridListMenuView(menus: Menu.dashboardMenus)
                        }.listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    default:
                        EmptyView()
                    }
                }
                
            }
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(spacing: 8) {
                        Image("ic_profile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .frame(width: 36, height: 36)
                            .onTapGesture {
                                self.onProfileTapped()
                            }
                        Text("Hi, Swornim")
                        
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 12) {
                        Image(systemName: "tray.and.arrow.down")
                            .toNavigationIcon()
                        
                        Image(systemName: "bell.fill")
                            .toNavigationIcon()
                        
                        Image(systemName: "scribble")
                            .toNavigationIcon()
                    }
                }
            }
        }
    }
}

//MARK: View Events
extension HomeScreen {
    func onProfileTapped() {
        router.route(menu: .init(routeCode: RouteCodeNavigator.ROUTE_PRIVATE_PROFILE))
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View { HomeScreen() }
}
