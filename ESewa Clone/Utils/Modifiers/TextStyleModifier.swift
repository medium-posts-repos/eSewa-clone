//
//  TextStyleModifier.swift
//  ESewa Clone
//
//  Created by swornim-shah on 08/12/2023.
//

import SwiftUI

public struct TextStyleModifier: ViewModifier {
    @EnvironmentObject var theme: ThemeManager

    public func body(content: Content) -> some View {
        content.foregroundColor(theme.currentTheme.onSurfaceColor)
        
    }
}

extension View {
    public func themeable() -> some View {
        self.modifier(TextStyleModifier())
    }
}
