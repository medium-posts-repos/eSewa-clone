//
//  File.swift
//  
//
//  Created by swornim-shah on 02/12/2023.
//

import Foundation
import Combine

public protocol FormUseCase: AnyObject {
    @available(iOS 13.0, *)
    func executeGet(code: String, params: RequestParams) -> AnyPublisher<BaseResponseDto<[FormItemResponseDto]>, Error>
}
