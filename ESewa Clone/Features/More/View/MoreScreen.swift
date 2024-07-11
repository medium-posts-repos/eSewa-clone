//
//  MoreScreen.swift
//  ESewa Clone
//
//  Created by swornim-shah on 18/11/2023.
//

import SwiftUI

public struct MoreScreen: View {
    @EnvironmentObject var theme: ThemeManager

    public var body: some View {
        VStack {
            List {
                ForEach(0..<20) { index in
                    Section {
                        MoreHeaderView()
                    }.listRowBackground(Color.clear)
                        .tag(index)
                }
            }.listStyle(.plain)
            Spacer()
        }
    }
}
