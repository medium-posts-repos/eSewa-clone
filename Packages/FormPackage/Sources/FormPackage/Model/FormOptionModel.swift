//
//  File.swift
//  
//
//  Created by swornim-shah on 08/03/2024.
//

import Foundation

public struct FormOptionModel: Codable, Hashable, Identifiable {
    public var id: Int?
    public var label: String?
    public var value: String?
    public var isTxnEnabled: Bool?
    
    public init() { }
}
