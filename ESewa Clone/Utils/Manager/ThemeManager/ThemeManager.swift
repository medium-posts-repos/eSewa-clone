//
//  ThemeManager.swift
//  ESewa Clone
//
//  Created by swornim-shah on 11/04/2024.
//

import Foundation
import SwiftUI

public enum AppCoreColorScheme {
    case light
    case dark
    case custom
    case blueish
}

public class ThemeManager: ObservableObject {
    public static let instance = ThemeManager()
    
    @Published
    public var currentTheme: CoreTheme = DarkTheme()
    
    public func updateTheme(scheme: AppCoreColorScheme) {
        switch scheme {
        case .light:
            self.currentTheme = LightTheme()
        case .dark:
            self.currentTheme = DarkTheme()
        default:
            self.currentTheme = LightTheme()
        }
    }
    
    private init() { }
}

public protocol CoreTheme {
    var tintImageColor: Color { get }
    var surfaceColor: Color { get }
    var onSurfaceColor: Color { get }
    var backgroundColor: Color { get }
    var onBackgroundColor: Color { get }
}

public class DarkTheme: CoreTheme {
    public var tintImageColor: Color { .white }
    public var surfaceColor: Color{ Color(hex: 0x0e1116) }
    public var onSurfaceColor: Color { Color(hex: 0xf5f5f5) }
    public var backgroundColor: Color { .black }
    public var onBackgroundColor: Color { .black }
}

public class LightTheme: CoreTheme {
    public var colorScheme: AppCoreColorScheme { .light }
    public var tintImageColor: Color { .black }
    public var surfaceColor: Color { .white }
    public var onSurfaceColor: Color { .black }
    public var backgroundColor: Color { .white }
    public var onBackgroundColor: Color { .white }
}
