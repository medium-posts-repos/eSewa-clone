//
//  HomeScreen.swift
//  ESewa Clone
//
//  Created by swornim-shah on 12/11/2023.
//

import SwiftUI

public struct HomeScreen: View {
        
    private let viewTypes: [HomeScreenViewType] = [
        .primaryMenuView,
        .secondaryMenuView,
        .offerView
    ]
    
    public var body: some View {
        VStack(alignment: .leading) {
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
                    case .offerView:
                        Section {
                            MenuListMoreView(dataSource: Menu.offerMenus)
                        }.listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                    default:
                        EmptyView()
                    }
                }
            }.listStyle(.plain)
                .padding(.init(top: 0, leading: -14, bottom: 0, trailing: -14)) // TODO: left right , padding issue
            Spacer()
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

//MARK: View Events
extension HomeScreen {

}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View { HomeScreen() }
}
