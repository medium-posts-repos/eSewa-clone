//
//  HelpAndSupportScreen.swift
//  ESewa Clone
//
//  Created by swornim-shah on 16/11/2023.
//

import SwiftUI
import DomainPackage

public struct HelpAndSupportScreen: View {
    public var body: some View {
        List {
            Section {
                VStack {
                    Text("Choose a service you need help with")
                    serviceOptionViews()
                    VStack(spacing: 16) {
                        Color.gray.frame(height: 1)
                        Text("View All".uppercased())
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.green)
                    }.padding(.init(top: 16, leading: 0, bottom: 0, trailing: 0))
                }.padding(.init(top: 2, leading: 12, bottom: 2, trailing: 12))
                    .modifier(GridMenuShapeViewModifier())
            }.listRowInsets(.init(top: 0, leading: 16, bottom: 12, trailing: 16))
            
            Section {
                HelpAndFaqListView()
            }.listRowInsets(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
                
            
        }.listStyle(.plain)
    }
    
    @ViewBuilder
    func serviceOptionViews() -> some View {
        let columns = Array(repeating: GridItem(.flexible(), spacing: 4), count: 2)
        let menus = MenuModel.helpAndSupportMenus
        let itemSize = (UIScreen.main.bounds.width - 52)/2 - 12
        
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(menus, id: \.self) { each in
                VStack(spacing: 4) {
                    Image(systemName: "house.fill")
                        .toNavigationIcon()
                        .foregroundColor(.orange)
                    Text(each.name ?? "")
                        .font(.body)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    Text(each.desc ?? "")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.5)
                    Spacer()
                }.padding()
                    .frame(width: itemSize, height: itemSize)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .strokeBorder(.gray, lineWidth: 0.5)
                    )
            }
        }
    }
}
