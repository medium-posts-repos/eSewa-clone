//
//  GenericFormScreenExt.swift
//  ESewa Clone
//
//  Created by swornim-shah on 22/02/2024.
//

import DomainPackage
import SwiftUI

// MARK: form fields view

public extension FormFieldModel {
    
    @ViewBuilder
    func provideSubmitField(title: String = "Submit") -> some View {
        VStack(alignment: .leading, spacing: 6) {
           Button(action: {}, label: {
               Text("\(label ?? "\(title)")")
           }).disabled(true)
           .buttonStyle(FillButtonStyle())
        }.disabled(false)
    }
    
    @ViewBuilder
    func provideTextField(delegate: TypeCallback<FormFieldTextEvent>?) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label ?? "")
                .font(.subheadline)
            FormTextFieldView(formField: self, delegate: delegate)
                .modifier(FormFieldViewModifier())
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
    
    @ViewBuilder
    func provideNoteField() -> some View {
        VStack(alignment: .leading) {
            Text(label ?? "")
                .foregroundColor(.green.opacity(0.9))
                .multilineTextAlignment(.leading)
        }.padding(.all, 6)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .foregroundColor(.green.opacity(0.4))
            )
    }
    
    @ViewBuilder
    func provideHeaderCaption() -> some View {
        VStack(alignment: .leading) {
            Text(captionTitle ?? "")
                .fontWeight(.bold)
                .themeable()
            Text(captionDesc ?? "")
                .font(.body)
                .fontWeight(.light)
                .themeable()
        }
    }

    @ViewBuilder
    func provideDropDownField(selection: Binding<Int>) -> some View {
        let options = options ?? []
        VStack {
            Picker(label ?? "", selection: selection) {
                ForEach(0..<options.count, id: \.self) { index in
                    Text(options[index].label ?? "").tag(index)
                }
            }
            .pickerStyle(.menu)
            .padding()
        }
    }
}
