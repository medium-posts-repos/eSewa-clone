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
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedFruitIndex = 0

    // MARK: States
    @State private var textInputs: [String] = []
    
    public let formFields: [FormFieldModel]
        
    public init(formFields: [FormFieldModel]) {
        self.formFields = formFields
    }
    
    public var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 22) {
                    ForEach(formFields, id: \.self) { each in
                        switch each.type {
                        case .TEXT, .AMOUNT:
                            provideTextField(field: each)
                        case .HEADER_CAPTION:
                            provideHeaderCaption(field: each)
                        case .NOTE:
                            provideNoteField(field: each)
                        case .DROPDOWN:
                            provideDropDownField(field: each)
                        default:
                            EmptyView()
                        }
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                .modifier(MenuShapeViewModifier(padding: 14))
            }
            
            Section {
                provideSubmitField(field: .init())
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
    
    private func provideSubmitField(field: FormFieldModel) -> some View {
        VStack(alignment: .leading, spacing: 6) {
           Button(action: {}, label: {
               Text("\(field.label ?? "Submit")")
           })
           .buttonStyle(FillButtonStyle())
        }
    }
    
    fileprivate func provideNoteField(field: FormFieldModel) -> some View {
        VStack(alignment: .leading) {
            Text(field.label ?? "")
                .foregroundColor(.green.opacity(0.9))
                .multilineTextAlignment(.leading)
        }.padding(.all, 6)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .foregroundColor(.green.opacity(0.4))
            )
    }
    
    fileprivate func provideHeaderCaption(field: FormFieldModel) -> some View {
        return VStack(alignment: .leading) {
            Text(field.captionTitle ?? "")
                .fontWeight(.bold)
                .themeable()
            Text(field.captionDesc ?? "")
                .font(.body)
                .fontWeight(.light)
                .themeable()
        }
    }
    
    fileprivate func provideDropDownField(field: FormFieldModel) -> some View {
        let options = field.options ?? []
//        let options = ["Apple", "Banana", "Orange", "Grapes"]
        return VStack {
            Picker(field.label ?? "", selection: $selectedFruitIndex) {
                ForEach(0..<options.count, id: \.self) { index in
                    Text(options[index].label ?? "").tag(index)
//                    Text(options[index]).tag(index)
                }
            }
            .pickerStyle(.menu)
            .padding()
        }
    }
}
