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
    @State public var selectedFruitIndex = 0

    // MARK: States
    @State private var textInputs: [String] = []
    
    public let formFields: [FormFieldModel]
    
    public var onSubmitClicked: VoidCallback
        
    public init(formFields: [FormFieldModel], onSubmitClicked: @escaping VoidCallback) {
        self.formFields = formFields
        self.onSubmitClicked = onSubmitClicked
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
                    .onTapGesture {
                        self.onSubmitClicked()
                    }
            }
            .listRowSeparator(.hidden)

        }.listStyle(.plain)
    }
}
