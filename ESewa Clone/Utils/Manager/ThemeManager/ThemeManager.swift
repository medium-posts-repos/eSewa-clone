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
    public var currentTheme: CoreTheme = LightTheme()
    
    public var activeScheme: AppCoreColorScheme {
        get {
            (currentTheme is DarkTheme) ? .dark : .light
        }
    }
    
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
    var onSurfaceHintColor: Color { get }
    var backgroundColor: Color { get }
    var onBackgroundColor: Color { get }
    var primaryColor: Color { get }
}

public class DarkTheme: CoreTheme {
    public var tintImageColor: Color { .white }
    public var surfaceColor: Color{ Color(hex: 0x0e1116) }
    public var onSurfaceColor: Color { Color(hex: 0xf5f5f5) }
    public var onSurfaceHintColor: Color { .init(hex: 0xe6e6e6) }
    public var backgroundColor: Color { .black }
    public var onBackgroundColor: Color { .black }
    public var primaryColor: Color { .green }
}

public class LightTheme: CoreTheme {
    public var colorScheme: AppCoreColorScheme { .light }
    public var tintImageColor: Color { .black }
    public var surfaceColor: Color { .init(hex: 0xFBFBFB) }
    public var onSurfaceColor: Color { .black }
    public var onSurfaceHintColor: Color { .init(hex: 0xe6e6e6) }
    public var backgroundColor: Color { .white }
    public var onBackgroundColor: Color { .white }
    public var primaryColor: Color { .green }
}
