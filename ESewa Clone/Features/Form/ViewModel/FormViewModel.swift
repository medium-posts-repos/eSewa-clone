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
            .sink(receiveCompletion: {_ in}, receiveValue: { [weak self] response in
                guard let _self = self else { return }
                _self.isLoading = false
                
                if response.status == true, let data = response.data?.formFields {
                    completion(data)
                } else {
                    completion([])
                }
            })
            .store(in: &cancellables)
    }
}
