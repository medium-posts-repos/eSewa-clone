//
//  BaseView.swift
//  ESewa Clone
//
//  Created by swornim-shah on 11/04/2024.
//

import Foundation
import SwiftUI

protocol BaseView: View {
    
    var theme: ThemeManager { get }
}

extension BaseView {
    var theme: ThemeManager { return Environment(\.appTheme).wrappedValue }
}

