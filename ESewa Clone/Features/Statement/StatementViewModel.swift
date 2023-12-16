//
//  StatementViewModel.swift
//  ESewa Clone
//
//  Created by swornim-shah on 15/12/2023.
//

import SwiftUI
import DomainPackage
import Combine

public final class StatementViewModel: BaseViewModel {
    
    @Published
    public var statementResult: PassthroughSubject<[StatementGroupDto], Never> = .init()
    
    public let statementUc: StatementUseCase
    
    public init(statementUc: StatementUseCase) {
        self.statementUc = statementUc
    }
    
    @MainActor
    func fetchStatements(code: String, completion: @escaping TypeCallback<[StatementGroupDto]>) async {
        isLoading = true
        statementUc.executePost(code: code, params: [:])
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                self.isLoading = false
            }, receiveValue: { response in
                if response.status == true, let data = response.data?.statementGroups {
                    self.statementResult.send(data)
                } else {
                    self.failureResult.send(.init(message: response.message))
                }
            })
            .store(in: &cancellables)
    }
}
