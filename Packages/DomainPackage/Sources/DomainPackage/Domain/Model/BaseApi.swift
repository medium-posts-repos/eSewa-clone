//
//  File.swift
//
//
//  Created by swornim-shah on 13/10/2023.
//

import Foundation

public struct BaseResponseDto<T: Codable>: BaseResponseProtocol {
    public var message: String?
    public var status: Bool?
    
    public var data: T?
    
    public init() { }
}

public protocol BaseResponseProtocol: Codable {
    var message: String? { get set }
    var status: Bool? { get set }
}

public struct NothingDto: Codable {
    public init() {}
}
