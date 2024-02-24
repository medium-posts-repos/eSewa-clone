//
//  CardShapeViewModifier.swift
//  ESewa Clone
//
//  Created by swornim-shah on 24/02/2024.
//

import Foundation
import SwiftUI

struct CardShapeViewModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    public var padding: CGFloat = 14
    
    public init(padding: CGFloat = 14) {
        self.padding = padding
    }

    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 6)
            )

    }
}
