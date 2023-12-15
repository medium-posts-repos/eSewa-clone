//
//  StatementViewModel.swift
//  ESewa Clone
//
//  Created by swornim-shah on 15/12/2023.
//

import SwiftUI
import DomainPackage

public final class StatementViewModel: BaseViewModel {
    
    public let statementUc: StatementUseCase
    
    public init(statementUc: StatementUseCase) {
        self.statementUc = statementUc
    }
    
    func fetchStatements(code: String, completion: @escaping TypeCallback<[StatementGroupDto]>) {
        isLoading = true
        statementUc.executePost(code: code, params: [:])
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {_ in}, receiveValue: { [weak self] response in
                guard let _self = self else { return }
                _self.isLoading = false
                
                if response.status == true, let data = response.data?.statementGroups {
                    completion(data)
                } else {
                    completion([])
                }
            })
            .store(in: &cancellables)
    }
}
