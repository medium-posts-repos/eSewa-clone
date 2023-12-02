//
//  HelpAndFaqListView.swift
//  ESewa Clone
//
//  Created by swornim-shah on 18/11/2023.
//

import SwiftUI
import DomainPackage

public struct HelpAndFaqListView: View {
    public var body: some View {
        VStack {
            HStack {
                Text("Help and FAQ'S")
                    .font(.headline)
                    .fontWeight(.regular)
                Spacer()
            }
            
            ScrollView {
                ForEach(MenuModel.helpAndFaqsMenus, id: \.id) { each in
                    HelpAndFaqItemView(menu: each)
                }
            }
            
            Text("View All".uppercased())
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.green)
                .padding(.top, 6)
        }.modifier(MenuShapeViewModifier())
            .frame(height: UIScreen.main.bounds.height / 3)
    }
}

public struct HelpAndFaqItemView: View {
    public var menu: MenuModel
    
    public init(menu: MenuModel) {
        self.menu = menu
    }
    
    public var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "house.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: .largeSize, height: .largeSize)
            VStack(alignment: .leading, spacing: 2) {
                Text(menu.name ?? "")
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                Text(menu.desc ?? "")
                    .font(.subheadline)
                
                Text("View Details")
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundColor(.green)
                    .padding(.top, 4)
            }
        }
    }
}
