//
//  MenuShapeViewModifier.swift
//  ESewa Clone
//
//  Created by swornim-shah on 13/11/2023.
//

import SwiftUI

struct MenuShapeViewModifier: ViewModifier {
    @EnvironmentObject var theme: ThemeManager
    
    public var padding: CGFloat = 14
    
    public init(padding: CGFloat = 14) {
        self.padding = padding
    }
    
    func body(content: Content) -> some View {
        content
            .padding(.all, padding)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(theme.currentTheme.surfaceColor)
            )
    }
}

struct FormFieldViewModifier: ViewModifier {
    @EnvironmentObject var theme: ThemeManager

    func body(content: Content) -> some View {
        content
            .background(theme.currentTheme.backgroundColor)
    }
}

struct GridMenuShapeViewModifier: ViewModifier {
    @EnvironmentObject var theme: ThemeManager

    func body(content: Content) -> some View {
        content
            .padding(.top, 14)
            .padding(.bottom, 14)
            .padding(.leading, 8)
            .padding(.trailing, 8)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(theme.currentTheme.surfaceColor)
            )
    }
}
