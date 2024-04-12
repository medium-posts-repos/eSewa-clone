//
//  MenuIconDescListView.swift
//  ESewa Clone
//
//  Created by swornim-shah on 22/11/2023.
//

import SwiftUI
import DomainPackage

public struct MenuIconDescListView: BaseView {
    @EnvironmentObject var theme: ThemeManager
    
    public var spacing: CGFloat = 0
    
    public var menus: [MenuModel]
    
    public init(menus: [MenuModel], spacing: CGFloat = 0) {
        self.menus = menus
        self.spacing = spacing
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            ForEach(Array(menus.enumerated()), id: \.offset) { index, item in
                MenuIconDescItemView(menu: item)
                    .padding(.bottom, index != menus.count - 1 ? spacing : .zero)
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

public struct MenuIconDescItemView: BaseView {
    @EnvironmentObject var theme: ThemeManager
    
    public var menu: MenuModel
    
    public init(menu: MenuModel) {
        self.menu = menu
    }
    
    public var body: some View {
        HStack(alignment: .top, spacing: 18) {
            Image(systemName: "house.fill")
                .toNavigationIcon()
                .foregroundColor(theme.currentTheme.tintImageColor)
            VStack(alignment: .leading) {
                Text(menu.name ?? "")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(theme.currentTheme.onSurfaceColor)
                
                Text(menu.desc ?? "")
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundColor(theme.currentTheme.onSurfaceColor)
            }
        }
    }
}
