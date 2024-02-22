//
//  NavigationRoutePath.swift
//  SnapBank
//
//  Created by swornim-shah on 30/09/2023.
//

import SwiftUI

public struct NavigationRoutePath {
    public var path = NavigationPath()
    
    public lazy var stacks: [RouteIntentDto] = []
    
    public mutating func append(_ item: RouteIntentDto) {
        path.append(item)
        stacks.append(item)
    }
    
    public mutating func removeLast(_ i: Int) {
        let removeCount = path.count - i - 1
        if path.count >= removeCount {
            path.removeLast(removeCount)
            
            stacks.removeLast(path.count + 1) // sync with path
        }
    }
}
