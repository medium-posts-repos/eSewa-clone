//
//  FormUseCaseImpl.swift
//  ESewa Clone
//
//  Created by swornim-shah on 02/12/2023.
//

import Foundation
import DomainPackage
import Combine
import NetworkPackage

public final class FormUseCaseImpl: BaseUseCase, FormUseCase {
    public func executeGet(code: String, params: RequestParams) -> AnyPublisher<BaseResponseDto<[FormItemResponseDto]>, Error> {
        let url = RouteProvider.shared.routeFrom(routeCode: code).getUrl
        return networkService.aSyncCall(request: url, model: BaseResponseDto<[FormItemResponseDto]>.self, method: .get, params: params)
            .map { response in
                return response
            }.eraseToAnyPublisher()
    }
    
    public func executeMerchantApi(code: String, params: RequestParams) -> AnyPublisher<BaseResponseDto<MerchantResponseDto>, Error> {
        let url = RouteProvider.shared.routeFrom(routeCode: code).getUrl
        return networkService.aSyncCall(request: url, model: BaseResponseDto<MerchantResponseDto>.self, method: .get, params: params)
            .map { response in
                return response
            }.eraseToAnyPublisher()
    }
}
