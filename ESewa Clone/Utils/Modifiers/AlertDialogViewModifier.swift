//
//  AlertDialogViewModifier.swift
//  ESewa Clone
//
//  Created by swornim-shah on 08/03/2024.
//

import DomainPackage
import SwiftUI

struct AlertDialogViewModifier: ViewModifier {
    @Binding var showingAlert: Bool
    private let title: String
    private let message: String
    private let onCompletion: VoidCallback
    
    public init(showingAlert: Binding<Bool>, title: String, message: String, onCompletion: @escaping VoidCallback) {
        self._showingAlert = showingAlert
        self.title = title
        self.message = message
        self.onCompletion = onCompletion
    }
    
    func body(content: Content) -> some View {
        content.alert(title, isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}
