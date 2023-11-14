//
//  MenuListMoreView.swift
//  ESewa Clone
//
//  Created by swornim-shah on 14/11/2023.
//

import SwiftUI

public struct MenuListMoreView: View {
    
    public var dataSource: [Menu]
    
    public init(dataSource: [Menu]) {
        self.dataSource = dataSource
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("Offers")
                Spacer()
                Button(action: {}) {
                    HStack {
                        Text("View More")
                        Image(systemName: "arrow.right.circle.fill")
                            .padding(.trailing, 10)
                    }
                }
            }
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 12) {
                    ForEach(dataSource, id: \.self) { item in
                        VStack(alignment: .center) {
                            Image(systemName: "house.fill")
                                .toNavigationIcon()
                                .foregroundColor(.green)
                            
                            Text(item.name ?? "")
                                .font(.system(size: 15))
                                .fontWeight(.medium)
                                .multilineTextAlignment(.center)
                                .lineLimit(2, reservesSpace: true)
                                .frame(maxWidth: 100)
                        }
                    }
                }
            }.scrollIndicators(.never)
        }
        .modifier(MenuShapeViewModifier())
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
