//
//  FormTextFieldView.swift
//  ESewa Clone
//
//  Created by swornim-shah on 02/12/2023.
//

import SwiftUI
import DomainPackage
import FormPackage

public protocol FormFieldTextDelegate: Protocol {
    func onTextChanged(field: FormFieldModel, text: String)
}

struct FormTextFieldView: View {
    @State private var textInput: String = ""
    
    public let formField: FormFieldModel
    
    public init(formField: FormFieldModel) {
        self.formField = formField
    }
    
    public var delegate: FormFieldTextDelegate?
    
    var body: some View {
        
        let binding = Binding<String>(get: {
            self.textInput
        }, set: {
            self.textInput = $0
            self.delegate?.onTextChanged(field: formField, text: $0)
        })
        
        TextField(formField.hint ?? "", text: binding)
            .keyboardType(formField.type == .AMOUNT ? .decimalPad : .default)
            .padding(.all, 12)
            .overlay(RoundedRectangle(cornerRadius: 6)
            .strokeBorder(Color.black, style: StrokeStyle(lineWidth: 0.0)))
    }
}
