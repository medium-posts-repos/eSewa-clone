//
//  MenuShapeViewModifier.swift
//  ESewa Clone
//
//  Created by swornim-shah on 13/11/2023.
//

import SwiftUI

struct MenuShapeViewModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        content
            .padding(.init(top: 14, leading: 8, bottom: 14, trailing: 8))
            .background(colorScheme == .dark ? Color(hex: 0x1c252e) : Color(hex: 0xf5f5f5))
            .cornerRadius(16)
    }
}
