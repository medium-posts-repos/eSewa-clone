//
//  ProgressViewModifier.swift
//  ESewa Clone
//
//  Created by swornim-shah on 08/12/2023.
//

import SwiftUI

struct ProgressViewModifier: ViewModifier {
    @EnvironmentObject var theme: ThemeManager

    var isLoading: Bool
    let isEnabled: Bool
    
    init(isLoading: Bool, isEnabled: Bool = true) {
        self.isLoading = isLoading
        self.isEnabled = isEnabled
    }
    
    func body(content: Content) -> some View {
        ZStack(alignment: .center) {
            content
                .disabled(isLoading)
            if isLoading && isEnabled {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: theme.currentTheme.onSurfaceColor))
            }
        }
    }
}
