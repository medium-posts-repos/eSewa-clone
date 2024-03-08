//
//  KeyValueView.swift
//  ESewa Clone
//
//  Created by swornim-shah on 08/03/2024.
//

import SwiftUI
import DomainPackage

public struct KeyValueView: View {
    
    @Environment(\.colorScheme) var colorScheme

    public var options: [OptionModel]
    
    public var body: some View {
        VStack(spacing: 16) {
            ForEach(options, id: \.self) { item in
                HStack {
                    Text(item.label ?? "")
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(item.value ?? "")
                        .font(.body)
                        .foregroundColor(.onSurfaceColor(colorScheme))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}
