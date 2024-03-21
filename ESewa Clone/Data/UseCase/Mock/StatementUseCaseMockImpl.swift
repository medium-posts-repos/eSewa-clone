//
//  StatementUseCaseMockImpl.swift
//  ESewa Clone
//
//  Created by swornim-shah on 21/03/2024.
//

import DomainPackage
import NetworkPackage
import Combine
import Foundation

public final class StatementUseCaseMockImpl: BaseUseCase, StatementUseCase {
    
    public func executePost(code: String, params: RequestParams) -> AnyPublisher<BaseResponseDto<StatementResponseDto>, Error> {
        let mockFormJsonString = """
                    {
                       "status":true,
                       "message":"Transaction history obtained successfully",
                       "code":"0",
                       "data":{
                          "statements":[
                             {
                                "date":"08-08-2021",
                                "amount":"1,000.00",
                                "balance":"141,031.20",
                                "reason":"Send 200 to Ncell top for the mobile payment bill",
                                "txnType":"Dr",
                                "txnDate":"2021-08-08 14:08:27"
                            },
                             {
                                "date":"08-08-2021",
                                "amount":"9.80",
                                "balance":"142,031.20",
                                "reason":"NT Prepaid Topup,9764",
                                "txnType":"Dr",
                                "txnDate":"2021-08-08 14:07:42"
                             },
                             {
                                "date":"08-08-2021",
                                "amount":"9.80",
                                "balance":"142,031.20",
                                "reason":"NT Prepaid Topup,9764",
                                "txnType":"Dr",
                                "txnDate":"2021-08-08 14:07:42"
                             },
                             {
                                "date":"08-08-2021",
                                "amount":"9.80",
                                "balance":"142,031.20",
                                "reason":"NT Prepaid Topup,9764",
                                "txnType":"Dr",
                                "txnDate":"2021-08-08 14:07:42"
                             },
                             {
                                "date":"08-08-2021",
                                "amount":"9.80",
                                "balance":"142,031.20",
                                "reason":"NT Prepaid Topup,9764",
                                "txnType":"Dr",
                                "txnDate":"2021-08-08 14:07:42"
                             },
                             {
                                "date":"08-08-2021",
                                "amount":"9.80",
                                "balance":"142,031.20",
                                "reason":"NT Prepaid Topup,9764",
                                "txnType":"Dr",
                                "txnDate":"2021-08-08 14:07:42"
                             },
                               {
                                "date":"03-08-2021",
                                "amount":"9.80",
                                "balance":"142,031.20",
                                "reason":"NT Prepaid Topup,9764",
                                "txnType":"Dr",
                                "txnDate":"2021-08-08 14:07:42"
                             },
                             {
                                "date":"02-01-2021",
                                "amount":"9.80",
                                "balance":"142,031.20",
                                "reason":"NT Prepaid Topup,9764",
                                "txnType":"Dr",
                                "txnDate":"2021-08-04 14:07:42"
                             },
                             {
                                "date":"08-01-2021",
                                "amount":"9.80",
                                "balance":"142,031.20",
                                "reason":"NT Prepaid Topup,9764",
                                "txnType":"Dr",
                                "txnDate":"2021-08-04 14:07:42"
                             },
                             {
                                "date":"08-01-2021",
                                "amount":"9.80",
                                "balance":"142,031.20",
                                "reason":"NT Prepaid Topup,9764",
                                "txnType":"Dr",
                                "txnDate":"2021-08-04 14:07:42"
                             }
                          ]
                       }
                    }
                    """
        
        // MARK: alternative to `Future` is to use `Defer`
        return Future<BaseResponseDto<StatementResponseDto>, Error> { promise in
            do {
                let response = try JSONDecoder().decode(BaseResponseDto<StatementResponseDto>.self, from: mockFormJsonString.data(using: .utf8)!)
                var finalRes = response
                finalRes.data?.statementGroups = response.data?.groupStatements ?? []
                
                promise(.success(finalRes))
            } catch {
                promise(.failure(error))
            }
        }.delay(for: 1.5, scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

