//
//  StatementScreen.swift
//  ESewa Clone
//
//  Created by swornim-shah on 12/11/2023.
//

import SwiftUI
import DomainPackage

public struct StatementScreen: View {
    
    @StateObject private var statementViewModel = AppFactory.shared.vmFactory.providesStatementViewModel()
    
    @State private var dataSource: [StatementGroupDto] = []

    public var body: some View {
        VStack {
            List {
                Section {
                    AccountBalanceView()
                }.listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                
                ForEach(dataSource, id: \.self) { item in
                    Section(header: Text("\(item.filterDate ?? "" )")) {
                        ForEach(item.statements ?? [], id: \.self) { statement in
                            Text("\(statement.reason ?? "")")
                        }
                    }
                }
            }
            .listStyle(.plain)
            .padding(.init(top: 0, leading: -14, bottom: 0, trailing: -14))
        }.modifier(ProgressViewModifier(isLoading: statementViewModel.isLoading))
            .onReceive(statementViewModel.statementResult) {
                self.dataSource = $0
            }
            .task {
                await statementViewModel.fetchStatements(code: RouteConstants.ACCOUNT_STATEMENTS) {
                    print("Incoming statements \($0)")
                }
            }
    }
}
