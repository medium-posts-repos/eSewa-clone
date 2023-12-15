//
//  File.swift
//  
//
//  Created by swornim-shah on 15/12/2023.
//

import Foundation
import Combine

public protocol BaseUseCaseProtocol: AnyObject {
    
    @available(iOS 13.0, *)
    func executePost<T: Codable>(code: String, params: RequestParams) -> AnyPublisher<BaseResponseDto<T>, Error>
}
