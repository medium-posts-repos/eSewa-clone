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
                
                guard let groupStatements = statementRes.data?.groupStatements else { return response }
                statementRes.data?.statementGroups = groupStatements
                
                return statementRes
            }.eraseToAnyPublisher()
    }
}
