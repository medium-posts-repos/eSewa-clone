//
//  FormViewModel.swift
//  ESewa Clone
//
//  Created by swornim-shah on 02/12/2023.
//

import DomainPackage

public final class FormViewModel: BaseViewModel {
    
    public let formUseCase: FormUseCase
    
    public init(formUseCase: FormUseCase) {
        self.formUseCase = formUseCase
    }
    
    func fetchForm(code: String, completion: @escaping TypeCallback<[FormFieldModel]>) {
        isLoading = true
        
        formUseCase.executeGet(code: code, params: [:])
            .sink(receiveCompletion: { [weak self] response in
                guard let _self = self else { return }
                _self.isLoading = false
            }, receiveValue: { response in
                if response.status == true, let data = response.data?.formFields {
                    completion(data)
                } else {
                    completion([])
                }
            })
            .store(in: &cancellables)
    }
    
    func executeMerchantApi(code: String, params: RequestParams, completion: @escaping TypeCallback<MerchantResponseDto?>) {
        isLoading = true
        formUseCase.executeMerchantApi(code: code, params: params)
            .sink(receiveCompletion: { [weak self] response in
                guard let _self = self else { return }
                _self.isLoading = false
            }, receiveValue: { response in
                completion(response.data)
            })
            .store(in: &cancellables)
    }
}
