//
//  FillButtonStyle.swift
//  ESewa Clone
//
//  Created by swornim-shah on 08/12/2023.
//

import SwiftUI
 
struct FillButtonStyle: ButtonStyle {

  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .font(.headline)
        .padding(.all, 10)
        .frame(maxWidth: .infinity, alignment: .center)
        .contentShape(Rectangle())
        .foregroundColor(configuration.isPressed ? Color.white.opacity(0.5) : Color.white)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.green)
        )
  }
}

struct PlainButtonStyle: ButtonStyle {

  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .font(.headline)
        .padding(.all, 10)
        .frame(maxWidth: .infinity, alignment: .center)
        .contentShape(Rectangle())
        .foregroundColor(configuration.isPressed ? Color.white.opacity(0.5) : Color.white)
        .background(
            RoundedRectangle(cornerRadius: 12)
        )
  }
}
