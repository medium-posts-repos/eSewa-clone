//
//  HorizontalProductPagerView.swift
//  ESewa Clone
//
//  Created by swornim-shah on 14/11/2023.
//

import SwiftUI
import DomainPackage

public struct HorizontalProductPagerView: View {
    
    public var products: [Product]
    
    public init(products: [Product]){
        self.products = products
    }
    
    public var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(products, id: \.self) {
                    ImageAsyncView(url: $0.imageUrl ?? "")
                        .frame(width: UIScreen.main.bounds.width - 16, height: 150)
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(16)
                }
            }
        }
    }
}
