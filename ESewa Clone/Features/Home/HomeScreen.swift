//
//  HomeScreen.swift
//  ESewa Clone
//
//  Created by swornim-shah on 12/11/2023.
//

import SwiftUI

public struct HomeScreen: View {
    public var body: some View {
        NavigationView {
            ScrollView {
                HomePrimaryMenuView()
                    .padding(.top, 18)
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(spacing: 8) {
                        Image("ic_profile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .frame(width: 36, height: 36)
                        Text("Hi, Swornim")
                            
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 12) {
                        Image(systemName: "tray.and.arrow.down")
                            .toNavigationIcon()
                            
                        Image(systemName: "bell.fill")
                            .toNavigationIcon()
                           
                        Image(systemName: "scribble")
                            .toNavigationIcon()
                    }
                }
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View { HomeScreen() }
}
