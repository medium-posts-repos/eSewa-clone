//
//  ExpandedView.swift
//  ESewa Clone
//
//  Created by swornim-shah on 08/12/2023.
//

import SwiftUI

struct ExpandedView<Content: View>: View {
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
                   content
                       .frame(width: geometry.size.width, height: geometry.size.height)
               }
    }
}
