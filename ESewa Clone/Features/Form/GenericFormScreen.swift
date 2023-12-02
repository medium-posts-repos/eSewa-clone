//
//  GenericFormScreen.swift
//  ESewa Clone
//
//  Created by swornim-shah on 02/12/2023.
//

import Foundation
import SwiftUI
import DomainPackage
import FormPackage

public struct GenericFormScreen: View  {
    
    // MARK: States
    @State private var textInputs: [String] = []
    
    public let formFields: [FormFieldModel]
    
    public init(formFields: [FormFieldModel]) {
        self.formFields = formFields
    }
    
    public var body: some View {
        ScrollView {
            ForEach(formFields, id: \.self) { each in
                switch each.type {
                case .TEXT:
                    provideTextField(field: each)
                default:
                    EmptyView()
                }
            }
        }
    }
}

// MARK: form fields view
extension GenericFormScreen {
    
    private func provideTextField(field: FormFieldModel) -> some View {
        VStack {
            FormTextFieldView(formField: field)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}
