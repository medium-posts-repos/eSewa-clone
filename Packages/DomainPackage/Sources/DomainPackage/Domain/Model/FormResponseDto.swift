//
//  File.swift
//  
//
//  Created by swornim-shah on 02/12/2023.
//

import Foundation

public struct FormResponseDto: Codable {
    public var status: Bool?
    public var message: String?
    
    public var data: FormItemResponseDto?
}

public struct FormItemResponseDto: Codable {
    public var label: String?
    public var type: String?
    public var regex: String?
    
    public init() { }
}
