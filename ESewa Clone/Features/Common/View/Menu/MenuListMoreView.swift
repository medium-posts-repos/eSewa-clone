//
//  MenuListMoreView.swift
//  ESewa Clone
//
//  Created by swornim-shah on 14/11/2023.
//

import SwiftUI
import DomainPackage

public struct MenuListMoreView: View {
    @EnvironmentObject var theme: ThemeManager

    public var dataSource: [MenuModel]
    
    public init(dataSource: [MenuModel]) {
        self.dataSource = dataSource
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("Offers")
                    .foregroundStyle(theme.currentTheme.onSurfaceColor)
                Spacer()
                Button(action: {}) {
                    HStack {
                        Text("View More")
                            .foregroundStyle(theme.currentTheme.onSurfaceColor)

                        Image(systemName: "arrow.right.circle.fill")
                            .padding(.trailing, 10)
                            .foregroundStyle(theme.currentTheme.tintImageColor)
                    }
                }
            }
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 12) {
                    ForEach(dataSource, id: \.self) { item in
                        VStack(alignment: .center) {
                            Image(systemName: "house.fill")
                                .toNavigationIcon()
                                .foregroundStyle(theme.currentTheme.tintImageColor)
                            
                            Text(item.name ?? "")
                                .font(.system(size: 15))
                                .fontWeight(.medium)
                                .multilineTextAlignment(.center)
                                .lineLimit(2, reservesSpace: true)
                                .frame(maxWidth: 100)
                                .foregroundStyle(theme.currentTheme.onSurfaceColor)
                        }
                    }
                }
            }.scrollIndicators(.never)
                .background(Color.clear)
        }
        .modifier(MenuShapeViewModifier())
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
