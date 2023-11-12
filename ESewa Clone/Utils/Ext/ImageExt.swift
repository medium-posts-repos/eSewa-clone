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
}
