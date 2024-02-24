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
    
    @available(iOS 13.0.0, *)
    public func build(menu: MenuModel?) async -> [FormFieldModel] {
        switch menu?.code {
        case MenuConstants.ELECTRICITY:
          return []
        default:
            return []
        }
    }
}
