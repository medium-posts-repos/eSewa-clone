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
        let columns = Array(repeating: GridItem(.adaptive(minimum: 80), spacing: 10), count: 4)
        
        VStack(alignment: .leading) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(menus, id: \.self) { each in
                    GridListItemMenuView(menu: each)
                }
            }.modifier(MenuShapeViewModifier())
        }
    }
}

public struct GridListItemMenuView: View {
    public var menu: Menu
    
    public var body: some View {
        VStack {
            Image(systemName: "house.fill")
                .toNavigationIcon()
                .foregroundColor(.green)
            
            Text(menu.name ?? "")
                .font(.system(size: 15))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            Spacer()
        }.frame(maxHeight: 80)
    }
}
