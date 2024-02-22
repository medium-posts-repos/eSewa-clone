//
//  GenericFormScreenExt.swift
//  ESewa Clone
//
//  Created by swornim-shah on 22/02/2024.
//

import DomainPackage
import SwiftUI

// MARK: form fields view
extension GenericFormScreen {
    
    public func provideTextField(field: FormFieldModel) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(field.label ?? "")
                .font(.subheadline)
            FormTextFieldView(formField: field)
                .modifier(FormFieldViewModifier())
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
    
    public func provideSubmitField(field: FormFieldModel) -> some View {
        VStack(alignment: .leading, spacing: 6) {
           Button(action: {}, label: {
               Text("\(field.label ?? "Submit")")
           }).disabled(true)
           .buttonStyle(FillButtonStyle())
        }.disabled(false)
    }
    
    public func provideNoteField(field: FormFieldModel) -> some View {
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
    
    public func provideHeaderCaption(field: FormFieldModel) -> some View {
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
    
    public func provideDropDownField(field: FormFieldModel) -> some View {
        let options = field.options ?? []
        return VStack {
            Picker(field.label ?? "", selection: $selectedFruitIndex) {
                ForEach(0..<options.count, id: \.self) { index in
                    Text(options[index].label ?? "").tag(index)
                }
            }
            .pickerStyle(.menu)
            .padding()
        }
    }
}
