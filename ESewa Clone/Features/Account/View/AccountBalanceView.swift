//
//  AccountBalanceView.swift
//  ESewa Clone
//
//  Created by swornim-shah on 15/12/2023.
//

import SwiftUI

public struct AccountBalanceView: View {
    @EnvironmentObject var theme: ThemeManager

    public var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "bell")
                .foregroundColor(theme.currentTheme.tintImageColor)

            VStack(alignment: .leading) {
                AttributedAmountView(currency: "NPR", amount: "XXXXXXXX", fontColor: theme.currentTheme.onSurfaceColor)
                Text("Balance")
                    .fontWeight(.light)
                    .foregroundColor(theme.currentTheme.onSurfaceColor)
            }
            Spacer()
            Image(systemName: "escape")
                .frame(width: .largeSize, height: .largeSize)
                .foregroundColor(theme.currentTheme.tintImageColor)
        }.modifier(MenuShapeViewModifier())
    }
}

struct AccountBalanceView_Previews: PreviewProvider {
    static var previews: some View {
        AccountBalanceView()
    }
}
