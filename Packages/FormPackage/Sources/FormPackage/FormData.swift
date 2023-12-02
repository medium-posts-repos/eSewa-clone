//
//  File.swift
//  
//
//  Created by swornim-shah on 02/12/2023.
//

import SwiftUI
import DomainPackage

public final class FormData {
    public init() { }
    
    public func build(menu: MenuModel?) async -> [FormField] {
        switch menu?.code {
        case MenuConstants.ELECTRICITY:
            if #available(iOS 13.0, *) {
                try? await Task.sleep(nanoseconds: 1_500_000_000)
            } else {
                // Fallback on earlier versions
            }
          return []
        default:
            return []
        }
    }
}
