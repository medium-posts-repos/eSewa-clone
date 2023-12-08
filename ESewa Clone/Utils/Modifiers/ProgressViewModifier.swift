//
//  ProgressViewModifier.swift
//  ESewa Clone
//
//  Created by swornim-shah on 08/12/2023.
//

import SwiftUI

struct ProgressViewModifier: ViewModifier {
    var isLoading: Bool
    
    func body(content: Content) -> some View {
        ZStack(alignment: .center) {
            content
                .disabled(isLoading)
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            }
        }
    }
}
