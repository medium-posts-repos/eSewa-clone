//
//  HomePrimaryMenuView.swift
//  ESewa Clone
//
//  Created by swornim-shah on 12/11/2023.
//

import SwiftUI

public struct HomePrimaryMenuView: View {
    @Environment(\.colorScheme) var colorScheme

    public var body: some View {
        HStack(spacing: 16) {
            verticalMenuView(title: "Send Money", icon: "house.fill")
                .frame(maxWidth: .infinity)
            
            verticalMenuView(title: "Send Money", icon: "bell.fill")
                .frame(maxWidth: .infinity)

            verticalMenuView(title: "Send Money", icon: "bell.fill")
                .frame(maxWidth: .infinity)

            verticalMenuView(title: "Send Money", icon: "bell.fill")
                .frame(maxWidth: .infinity)
        }
        .padding(.init(top: 12, leading: 8, bottom: 12, trailing: 8))
        .background(colorScheme == .dark ? Color(hex: 0x1c252e) : Color(hex: 0xf5f5f5))
        .cornerRadius(16)
    }
    
    @ViewBuilder
    func verticalMenuView(title: String, icon: String) -> some View {
        VStack {
            Image(systemName: icon)
                .toNavigationIcon()
            
            Text(title)
                .font(.system(size: 15))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
        }
    }
}

struct HomePrimaryMenuView_Previews: PreviewProvider {
    static var previews: some View { HomePrimaryMenuView() }
}
