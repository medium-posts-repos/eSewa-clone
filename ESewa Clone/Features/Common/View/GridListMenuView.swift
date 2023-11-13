//
//  GridListMenuView.swift
//  ESewa Clone
//
//  Created by swornim-shah on 13/11/2023.
//

import SwiftUI

public struct GridListMenuView: View {
    public var menus: [Menu]
    
    public var body: some View {
        let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 4)
        
        LazyVGrid(columns: columns, spacing: 24) {
            ForEach(menus, id: \.self) { each in
                GridListItemMenuView(menu: each)
            }
        }.modifier(MenuShapeViewModifier())
    }
}

public struct GridListItemMenuView: View {
    public var menu: Menu
    
    public var body: some View {
        VStack {
            Image(systemName: "house.fill")
                .toNavigationIcon()
            
            Text(menu.name ?? "")
                .font(.system(size: 15))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
        }
    }
}
