//
//  StatementApi.swift
//  
//
//  Created by swornim-shah on 15/12/2023.
//

public struct StatementResponseDto: Codable {
    
    public var statements: [StatementResItemDto]?
    
    public var statementGroups: [StatementGroupDto]?
}

// Api response
public struct StatementResItemDto: Codable, Hashable {
    public var amount: String?
    public var balance: String?
    public var txnType: String?
    public var txnDate: String?
    public var reason: String?
    
    public init() { }
}

// Internal model to group dates
public struct StatementGroupDto: Codable, Hashable {
    public var statements: [StatementResItemDto]? /* grouped items */
    public var filterDate: String? /* group by date */
    
    public init() { }
}
