//
//  File.swift
//  
//
//  Created by swornim-shah on 07/03/2024.
//

import Foundation

public struct MerchantResponseDto: Codable, Hashable, Identifiable {
    public var id: Int?

    public var message: String?
    public var status: Bool?
    public var invoices: [OptionModel]?
    
    public init() {}
    
}
