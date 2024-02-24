//
//  GenericConfirmationVc.swift
//  ESewa Clone
//
//  Created by swornim-shah on 24/02/2024.
//

import SwiftUI
import DomainPackage

public struct GenericConfirmationVc: View {
    
    @State private var stateShowConfirmation = false
    
    public var body: some View {
        List {
            Section {
                AccountBalanceView()
            }.listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            
            Section {
                VStack(alignment: .center, spacing: 8) {
                    Text("You are paying")
                        .font(.headline)
                        .fontWeight(.light)
                    AttributedAmountView(currency: "NPR", amount: "500.00", amountFont: .largeTitle, fontColor: .green)
                    Text("Topup")
                        .fontWeight(.bold)
                }.frame(maxWidth: .infinity, alignment: .center)
            }.modifier(MenuShapeViewModifier(padding: 14))
                .padding(.init(top: 18, leading: 0, bottom: 18, trailing: 0))
                .listRowSeparator(.hidden)
            
            Section {
                FormFieldModel().provideSubmitField()
                    .onTapGesture {
                        self.stateShowConfirmation = true
                    }
            }.listRowSeparator(.hidden)
        }.listStyle(.plain)
            .buildSheet(binding: $stateShowConfirmation) {
                TxnPinSheetView()
                    .presentationDetents([.medium])
            }
    }
}

struct GenericConfirmationVc_Previews: PreviewProvider {
    static var previews: some View {
        GenericConfirmationVc()
    }
}

