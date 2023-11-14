//
//  HomeToolbarView.swift
//  ESewa Clone
//
//  Created by swornim-shah on 14/11/2023.
//

import SwiftUI

public struct HomeToolbarView: ToolbarContent {
    
    public var onProfileTapped: VoidCallback?
    
    public init(onProfileTapped: VoidCallback? = nil) {
        self.onProfileTapped = onProfileTapped
    }
    
    public var body: some ToolbarContent {
        
        ToolbarItem(placement: .navigationBarLeading) {
            HStack(spacing: 8) {
                Image("ic_profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(width: 36, height: 36)
                    .onTapGesture {
                        self.onProfileTapped?()
                    }
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
