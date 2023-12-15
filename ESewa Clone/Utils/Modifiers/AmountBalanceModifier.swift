//
//  AmountBalanceModifier.swift
//  ESewa Clone
//
//  Created by swornim-shah on 15/12/2023.
//

import SwiftUI

public struct AttributedAmountView: View {
    
    public var currency: String
    public var amount: String
    
    public init(currency: String, amount: String) {
        self.currency = currency
        self.amount = amount
    }
    
    public var body: some View {
        var currencyAttribute: AttributedString {
            var result = AttributedString(currency)
            result.font = .caption
            result.foregroundColor = .primary
            return result
        }
        
        var amountAttribute: AttributedString {
            var result = AttributedString(amount)
            result.font = .headline
            result.foregroundColor = .primary
            return result
        }
        
        Text(currencyAttribute + " " + amountAttribute)
    }
}
