//
//  TextStyleModifier.swift
//  ESewa Clone
//
//  Created by swornim-shah on 08/12/2023.
//

import SwiftUI

public struct TextStyleModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content.foregroundColor(.primary)
    }
}

extension View {
    public func themeable() -> some View {
        self.modifier(TextStyleModifier())
    }
}
