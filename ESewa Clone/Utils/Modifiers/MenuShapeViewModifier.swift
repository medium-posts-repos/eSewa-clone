//
//  MenuShapeViewModifier.swift
//  ESewa Clone
//
//  Created by swornim-shah on 13/11/2023.
//

import SwiftUI

struct MenuShapeViewModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
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
//                    .foregroundColor(colorScheme == .dark ? Color(hex: 0x0e1116) : Color(hex: 0xf5f5f5))
                    .foregroundColor(theme.currentTheme.surfaceColor)
            )
    }
}

struct FormFieldViewModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .background(colorScheme == .dark ? Color(hex: 0x2b3846) : Color(hex: 0xf5f5f5))
    }
}

struct GridMenuShapeViewModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .padding(.top, 14)
            .padding(.bottom, 14)
            .padding(.leading, 8)
            .padding(.trailing, 8)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(colorScheme == .dark ? Color(hex: 0x1c252e) : Color(hex: 0xf5f5f5))
            )
    }
}
