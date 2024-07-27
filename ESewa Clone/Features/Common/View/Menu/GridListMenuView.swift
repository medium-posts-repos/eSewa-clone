//
//  GridListMenuView.swift
//  ESewa Clone
//
//  Created by swornim-shah on 13/11/2023.
//

import SwiftUI
import DomainPackage

public struct GridListMenuView: View {
    public var menus: [MenuModel]
    
    public var onItemClick: TypeCallback<MenuModel>?
    
    public var body: some View {
        let columns = Array(repeating: GridItem(.adaptive(minimum: 80), spacing: 12), count: 4)
        
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(menus, id: \.self) { each in
                GridListItemMenuView(menu: each)
                    .onTapGesture {
                        self.onItemClick?(each)
                    }
            }
        }.modifier(GridMenuShapeViewModifier())
    }
}

public struct GridListItemMenuView: BaseView {
    @EnvironmentObject var theme: ThemeManager

    public var menu: MenuModel
    
    public var body: some View {
        VStack {
            Image(systemName: "house.fill")
                .toNavigationIcon()
                .foregroundColor(.green)
            
            Text(menu.name ?? "")
                .font(.system(size: 15))
                .foregroundColor(theme.currentTheme.onSurfaceColor)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            Spacer()
        }.frame(maxHeight: 80)
    }
}
