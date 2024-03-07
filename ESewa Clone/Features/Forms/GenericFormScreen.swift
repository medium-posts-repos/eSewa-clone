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
    @State private var selectedDropDowns = 0
    @State private var textInputs: [String] = []
    
    public let formFields: [FormFieldModel]
    public var onSubmitClicked: VoidCallback?
            
    public init(formFields: [FormFieldModel], onSubmitClicked: VoidCallback?) {
        self.formFields = formFields
        self.onSubmitClicked = onSubmitClicked
    }
    
    public var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 22) {
                     ForEach(formFields, id: \.self) { formField in
                         switch formField.type {
                         case .TEXT, .AMOUNT:
                             formField.provideTextField { _ in
                                 
                             }

                        case .HEADER_CAPTION:
                            formField.provideHeaderCaption()
                        case .NOTE:
                            formField.provideNoteField()
                        case .DROPDOWN:
                            formField.provideDropDownField(selection: $selectedDropDowns)
                        default:
                            EmptyView()
                        }
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                .modifier(MenuShapeViewModifier(padding: 14))
            }
            
            Section {
                FormFieldModel().provideSubmitField()
                    .onTapGesture {
                        self.onSubmitTapped()
                    }
            }
            .listRowSeparator(.hidden)

        }.listStyle(.plain)
    }
}

// MARK: view events
extension GenericFormScreen {
    func onSubmitTapped() {
        guard let onSubmitClicked = self.onSubmitClicked  else {
            return
        }
        
        onSubmitClicked()
    }
}
