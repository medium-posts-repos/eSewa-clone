//
//  StatementScreen.swift
//  ESewa Clone
//
//  Created by swornim-shah on 12/11/2023.
//

import SwiftUI
import DomainPackage

public struct StatementScreen: View {
    @ObservedObject
    private var statementViewModel = AppFactory.shared.vmFactory.providesStatementViewModel()
    
    public var body: some View {
        VStack {
            List {
                Section {
                    AccountBalanceView()
                        .task {
                            statementViewModel.fetchStatements(code: RouteConstants.ACCOUNT_STATEMENTS) {
                                print("Incoming statements \($0)")
                            }
                        }
                       
                }.listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .padding(.init(top: 0, leading: -14, bottom: 0, trailing: -14))
        }.modifier(ProgressViewModifier(isLoading: statementViewModel.isLoading))
    }
}
