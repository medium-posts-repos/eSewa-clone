//
//  MoreScreen.swift
//  ESewa Clone
//
//  Created by swornim-shah on 18/11/2023.
//

import SwiftUI

public struct MoreScreen: View {
    public var body: some View {
        List {
            Section {
                MoreHeaderView()
            }
        }.listStyle(.plain)
    }
}
