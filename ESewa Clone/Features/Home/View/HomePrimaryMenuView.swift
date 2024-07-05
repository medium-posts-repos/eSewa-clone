//
//  HomePrimaryMenuView.swift
//  ESewa Clone
//
//  Created by swornim-shah on 12/11/2023.
//

import SwiftUI

public struct HomePrimaryMenuView: BaseView {
    
    @EnvironmentObject var theme: ThemeManager

    public var body: some View {
        HStack(spacing: 14) {
            verticalMenuView(title: "Loads Money", icon: "house.fill")
                .frame(maxWidth: .infinity)
            
            verticalMenuView(title: "Send Money", icon: "bell.fill")
                .frame(maxWidth: .infinity)

            verticalMenuView(title: "Bank Transfer", icon: "bell.fill")
                .frame(maxWidth: .infinity)

            verticalMenuView(title: "Use Remittance", icon: "bell.fill")
                .frame(maxWidth: .infinity)
        }.modifier(MenuShapeViewModifier())
    }
    
    @ViewBuilder
    func verticalMenuView(title: String, icon: String) -> some View {
        VStack {
            Image(systemName: icon)
                .renderingMode(.template)
                .toNavigationIcon()
                .foregroundColor(theme.currentTheme.tintImageColor)
                .onTapGesture {
                    theme.updateTheme(scheme: theme.activeScheme == .light ? .dark : .light)
                }
            
            Text(title)
                .font(.system(size: 15))
                .fontWeight(.medium)
                .foregroundColor(theme.currentTheme.onSurfaceColor)
                .multilineTextAlignment(.center)
                .onTapGesture {
                    theme.updateTheme(scheme: theme.activeScheme == .light ? .dark : .light)
                }
        }
    }
}

struct HomePrimaryMenuView_Previews: PreviewProvider {
    static var previews: some View { HomePrimaryMenuView() }
}
