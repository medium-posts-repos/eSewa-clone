//
//  SuccessFormScreen.swift
//  ESewa Clone
//
//  Created by swornim-shah on 07/03/2024.
//

import SwiftUI
import DomainPackage

public struct  SuccessFormScreen : View {
    private var response: MerchantResponseDto?
    private var onRouteToDashboad: VoidCallback?
    
    public init(response: MerchantResponseDto? = nil, onRouteToDashboad: VoidCallback? = nil) {
        self.response = response
        self.onRouteToDashboad = onRouteToDashboad
    }
    
    public var body: some View {
        List {
            Section {
                AccountBalanceView()
            }.listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            
            Section {
                VStack(alignment: .center, spacing: 8) {
                    Text("Successfully paid")
                        .font(.headline)
                        .fontWeight(.light)
                    AttributedAmountView(currency: "NPR", amount: "1500.00", amountFont: .largeTitle, fontColor: .green)
                    Text("To Astin Martin")
                        .fontWeight(.bold)
                }.frame(maxWidth: .infinity, alignment: .center)
            }.modifier(MenuShapeViewModifier(padding: 14))
                .listRowSeparator(.hidden)
            
            Section {
                KeyValueView(options: response?.invoices ?? [])
            }.modifier(MenuShapeViewModifier(padding: 14))
                .listRowSeparator(.hidden)
            
            Section {
                FormFieldModel().provideSubmitField(title: "Go to Dashboard")
                    .onTapGesture {
                        self.onRouteToDashboad?()
                    }
            }
            .listRowSeparator(.hidden)
        }.listStyle(.plain)
    }
}
