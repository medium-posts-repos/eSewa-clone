//
//  ImageExt.swift
//  ESewa Clone
//
//  Created by swornim-shah on 12/11/2023.
//

import SwiftUI

public extension Image {
    
    @ViewBuilder
    func toNavigationIcon() -> some View {
        resizable()
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
            .frame(width: 20, height: 20)
    }
    
    func data(url: String) -> Self {
        if let url = URL(string: url), let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data) ?? .init())
                .resizable()
        }
        
        return self
    }
}
