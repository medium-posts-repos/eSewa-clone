//
//  StatementScreen.swift
//  ESewa Clone
//
//  Created by swornim-shah on 12/11/2023.
//

import SwiftUI
import DomainPackage

public struct StatementScreen: View {
    @EnvironmentObject var theme: ThemeManager
    
    @StateObject private var statementViewModel = AppFactory.shared.vmFactory.providesStatementViewModel()
    
    @State private var dataSource: [StatementGroupDto] = []
    
    public var body: some View {
        List {
            Section {
                AccountBalanceView()
            }.listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            
            ForEach(dataSource, id: \.self) { item in
                renderItems(item: item)
            }
        }.scrollContentBackground(.hidden)
        .background(theme.currentTheme.backgroundColor)
        .listStyle(.grouped)
        .padding(.init(top: 0, leading: -14, bottom: 0, trailing: -14))
        .modifier(ProgressViewModifier(isLoading: statementViewModel.isLoading, isEnabled: dataSource.isEmpty))
        .onReceive(statementViewModel.statementResult) {
            self.dataSource = $0
        }.task {
            await statementViewModel.fetchStatements(code: RouteConstants.ACCOUNT_STATEMENTS) {
                print("Incoming statements \($0)")
            }
        }
    }
    
    func sectionHeader(item: StatementGroupDto) -> Text {
        Text("\(item.filterDate ?? "" )")
            .foregroundColor(theme.currentTheme.onSurfaceColor)
    }
    
    func renderItems(item: StatementGroupDto) -> some View {
        Section(header: sectionHeader(item: item)) {
            ForEach(item.statements ?? [], id: \.self) { statement in
                Text("\(statement.reason ?? "")")
                    .foregroundColor(theme.currentTheme.onSurfaceColor)
                    .padding(.leading, 8)
            }
        }.listRowBackground(Color.clear)
    }
}
