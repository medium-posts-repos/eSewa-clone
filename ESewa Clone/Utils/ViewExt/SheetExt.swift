//
//  SheetExt.swift
//  ESewa Clone
//
//  Created by swornim-shah on 24/02/2024.
//

import Foundation
import SwiftUI

public extension View {
    
    @ViewBuilder
    func buildSheet<Content: View>(binding: Binding<Bool>, content: @escaping () -> Content) -> some View {
        sheet(isPresented: binding, content: content)
    }
}
