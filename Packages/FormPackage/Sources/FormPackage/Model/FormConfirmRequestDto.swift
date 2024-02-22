//
//  File.swift
//  
//
//  Created by swornim-shah on 22/02/2024.
//

import Foundation

public struct FormConfirmRequestDto: Hashable {
  
    public var id: Int?
    
    public init(id: Int? = nil) {
        self.id = id
    }
    
}
