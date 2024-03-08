//
//  ColorExt.swift
//  ESewa Clone
//
//  Created by swornim-shah on 12/11/2023.
//

import SwiftUI

public extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

public extension Color {
    static func onSurfaceColor(_ colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            return Color(hex: 0x1c252e)
        case .dark:
           return Color(hex: 0xf5f5f5)
        @unknown default:
            return Color(hex: 0xf5f5f5)
        }
    }
}
