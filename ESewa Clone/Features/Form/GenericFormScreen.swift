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
        List {
            Section {
                VStack(spacing: 22) {
                    ForEach(formFields, id: \.self) { each in
                        switch each.type {
                        case .TEXT, .AMOUNT:
                            provideTextField(field: each)
                        default:
                            EmptyView()
                        }
                    }
                }.modifier(MenuShapeViewModifier(padding: 14))
            }
            .listRowSeparator(.hidden)

        }.listStyle(.plain)
    }
}

// MARK: form fields view
extension GenericFormScreen {
    
    private func provideTextField(field: FormFieldModel) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(field.label ?? "")
                .font(.subheadline)
            FormTextFieldView(formField: field)
                .modifier(FormFieldViewModifier())
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}
