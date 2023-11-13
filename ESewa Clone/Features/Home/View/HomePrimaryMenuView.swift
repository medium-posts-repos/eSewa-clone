//
//  HomePrimaryMenuView.swift
//  ESewa Clone
//
//  Created by swornim-shah on 12/11/2023.
//

import SwiftUI

public struct HomePrimaryMenuView: View {
    public var body: some View {
        HStack(spacing: 16) {
            verticalMenuView(title: "Load Money", icon: "house.fill")
                .frame(maxWidth: .infinity)
            
            verticalMenuView(title: "Send Money", icon: "bell.fill")
                .frame(maxWidth: .infinity)

            verticalMenuView(title: "Bank Transfer", icon: "bell.fill")
                .frame(maxWidth: .infinity)

            verticalMenuView(title: "Remittance", icon: "bell.fill")
                .frame(maxWidth: .infinity)
        }.modifier(MenuShapeViewModifier())
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
