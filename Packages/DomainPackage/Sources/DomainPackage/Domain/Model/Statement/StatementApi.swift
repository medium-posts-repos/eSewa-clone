//
//  StatementApi.swift
//  
//
//  Created by swornim-shah on 15/12/2023.
//

import Foundation

public struct StatementResponseDto: Codable {
    
    public var statements: [StatementResItemDto]?
    public var statementGroups: [StatementGroupDto]?
    
    public var groupStatements: [StatementGroupDto] {
        get {
            let groupDateFormatter = DateFormatter()
            groupDateFormatter.dateFormat = "yyyy-MM-dd" // 2021-08-08 14:08:27
            
            var duplicateDateDict: [String: Bool] = [:]
            var groupStatementDict: [String: [StatementResItemDto]] = [:]
            
            return (statements ?? []).compactMap {
                if let txnDate = $0.txnDate {
                    
                    var lastStatementGroups = groupStatementDict[txnDate] ?? []
                    lastStatementGroups.append($0)
                    groupStatementDict[txnDate] = lastStatementGroups
                    
                    if duplicateDateDict[txnDate] != true {
                        duplicateDateDict[txnDate] = true
                        return txnDate
                    }
                    
                    return nil
                }
                return nil
            }.sorted { (string1: String, string2: String) -> Bool in
                if let date1 = groupDateFormatter.date(from: string1), let date2 = groupDateFormatter.date(from: string2) {
                    return date1 > date2
                }
                return false
            }.compactMap {
                var eachGroup = StatementGroupDto()
                eachGroup.filterDate = $0
                eachGroup.statements = groupStatementDict[$0]
                return eachGroup
            }
        }
    }
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
