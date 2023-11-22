//
//  MenuShapeViewModifier.swift
//  ESewa Clone
//
//  Created by swornim-shah on 13/11/2023.
//

import SwiftUI

struct MenuShapeViewModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    public var padding: CGFloat = 14
    
    public init(padding: CGFloat = 14) {
        self.padding = padding
    }

    func body(content: Content) -> some View {
        content
            .padding(.all, padding)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(colorScheme == .dark ? Color(hex: 0x1c252e) : Color(hex: 0xf5f5f5))

            )

    }
}

struct GridMenuShapeViewModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        content
            .padding(.top, 14)
            .padding(.bottom, 14)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(colorScheme == .dark ? Color(hex: 0x1c252e) : Color(hex: 0xf5f5f5))
            )
            .cornerRadius(16)
    }
}
