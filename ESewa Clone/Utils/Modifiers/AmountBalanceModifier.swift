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
    public var amountFont: Font
    public var fontColor: Color
    
    public init(currency: String, amount: String, amountFont: Font = .headline, fontColor: Color = .primary) {
        self.currency = currency
        self.amount = amount
        self.amountFont = amountFont
        self.fontColor = fontColor
    }
    
    public var body: some View {
        var currencyAttribute: AttributedString {
            var result = AttributedString(currency)
            result.font = .caption
            result.foregroundColor = fontColor
            return result
        }
        
        var amountAttribute: AttributedString {
            var result = AttributedString(amount)
            result.font = amountFont
            result.foregroundColor = fontColor
            return result
        }
        
        Text(currencyAttribute + " " + amountAttribute)
    }
}
