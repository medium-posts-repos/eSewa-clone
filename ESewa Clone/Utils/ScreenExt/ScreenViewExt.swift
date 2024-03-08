//
//  ScreenViewExt.swift
//  ESewa Clone
//
//  Created by swornim-shah on 08/03/2024.
//

import Foundation
import SwiftUI

public extension View {
    
    @ViewBuilder
    func addProgressAndLoader(viewModel: BaseViewModel) -> some View {
        let alertBinding = Binding<Bool>(
            get: { viewModel.showAlert == true },
                    set: { _ in viewModel.showAlert = false }
                )
        
        self.modifier(ProgressViewModifier(isLoading: viewModel.isLoading))
            .modifier(AlertDialogViewModifier(showingAlert: alertBinding, title: "", message: "Failure", onCompletion: { }))
    }
}
