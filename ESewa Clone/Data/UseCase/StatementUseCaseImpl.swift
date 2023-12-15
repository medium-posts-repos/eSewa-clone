//
//  StatementUseCaseImpl.swift
//  ESewa Clone
//
//  Created by swornim-shah on 15/12/2023.
//

import DomainPackage
import NetworkPackage
import Combine
import Foundation

public final class StatementUseCaseImpl: BaseUseCase, StatementUseCase {
    
    public func executePost(code: String, params: RequestParams) -> AnyPublisher<BaseResponseDto<StatementResponseDto>, Error> {
        
        let url = RouteProvider.shared.routeFrom(routeCode: code).getUrl
        return networkService.aSyncCall(request: url, model: BaseResponseDto<StatementResponseDto>.self, method: .get, params: params)
            .map { response in
                var statementRes = response
                
                var duplicateDateDict: [String: Bool] = [:]
                var groupStatementDict: [String: [StatementResItemDto]] = [:]
                
                let groupDateFormatter = DateFormatter()
                groupDateFormatter.dateFormat = "yyyy-MM-dd" // 2021-08-08 14:08:27
                
                guard let items = statementRes.data?.statements else { return response }
                
                // unique dates + sorted in descending order
                let sortedGroupStatementRes = items.compactMap {
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
                
                statementRes.data?.statementGroups = sortedGroupStatementRes
    
                return statementRes
            }.eraseToAnyPublisher()
    }
}
