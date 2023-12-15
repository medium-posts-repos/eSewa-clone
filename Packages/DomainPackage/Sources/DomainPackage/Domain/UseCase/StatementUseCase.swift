//
//  File.swift
//  
//
//  Created by swornim-shah on 15/12/2023.
//

import Combine

public protocol StatementUseCase {
    @available(iOS 13.0, *)
    func executePost(code: String, params: RequestParams) -> AnyPublisher<BaseResponseDto<StatementResponseDto>, Error>
}
