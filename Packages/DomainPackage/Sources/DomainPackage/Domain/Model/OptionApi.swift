//
//  OptionModel.swift
//  
//
//  Created by swornim-shah on 08/03/2024.
//

import Foundation

public struct OptionModel: Codable, Hashable, Identifiable {
    public var id: Int?
    public var label: String?
    public var value: String?
    public var isTxnEnabled: Bool?
    
    public init() { }
}

