//
//  ThemeEnvironment.swift
//  ESewa Clone
//
//  Created by swornim-shah on 11/04/2024.
//

import Foundation
import SwiftUI

public struct ThemeEnvironmentKey: EnvironmentKey {
    public static var defaultValue: ThemeManager = ThemeManager.instance
}

public extension EnvironmentValues {
    var appTheme: ThemeManager {
        get { self[ThemeEnvironmentKey.self] }
        set { self[ThemeEnvironmentKey.self] = newValue }
    }
}
