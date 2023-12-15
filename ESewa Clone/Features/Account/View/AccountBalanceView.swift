//
//  AccountBalanceView.swift
//  ESewa Clone
//
//  Created by swornim-shah on 15/12/2023.
//

import SwiftUI

public struct AccountBalanceView: View {
    public var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "bell")
            VStack(alignment: .leading) {
                AttributedAmountView(currency: "NPR", amount: "XXXXXXXX")
                Text("Balance")
                    .fontWeight(.light)
            }
            Spacer()
            Image(systemName: "escape")
                .frame(width: .largeSize, height: .largeSize)
        }.modifier(MenuShapeViewModifier())
    }
}

struct AccountBalanceView_Previews: PreviewProvider {
    static var previews: some View {
        AccountBalanceView()
    }
}
