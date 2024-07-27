//
//  ProfileHeaderView.swift
//  ESewa Clone
//
//  Created by swornim-shah on 18/11/2023.
//

import SwiftUI

public struct MoreHeaderView: View {
    @EnvironmentObject var theme: ThemeManager

    public var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(systemName: "house.fill")
                    .resizable()
                    .frame(width: .largeSize, height: .largeSize)
                    .foregroundStyle(theme.currentTheme.tintImageColor)
                VStack(alignment: .leading) {
                    Text("Swornim Bikram Shah")
                        .fontWeight(.medium)
                        .foregroundStyle(theme.currentTheme.onSurfaceColor)

                    Text("9813847444")
                        .fontWeight(.regular)
                        .foregroundStyle(theme.currentTheme.onSurfaceColor)

                    Button(action: {}) {
                        HStack {
                            Image(systemName: "house.fill")
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 12, height: 12)
                                .foregroundStyle(theme.currentTheme.tintImageColor)

                            Text("Active")
                                .foregroundStyle(theme.currentTheme.onSurfaceColor)
                        }
                    }.foregroundColor(.green)
                }
                Spacer()
                Button(action: {}) {
                    HStack {
                        Image(systemName: "bell.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 12, height: 12)
                            .foregroundStyle(theme.currentTheme.tintImageColor)

                        Text("Verified".uppercased())
                            .font(.init(.system(size: 12)))
                            .foregroundStyle(theme.currentTheme.onSurfaceColor)
                    }.padding(.init(top: 4, leading: 8, bottom: 4, trailing: 8))
                }.background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.green.opacity(0.8))
                )
                .padding(.top, -4)
            }
        }.modifier(MenuShapeViewModifier())
    }
}
