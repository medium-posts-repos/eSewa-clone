//
//  VmFactory.swift
//  Tweetder
//
//  Created by swornim-shah on 02/10/2023.
//

import DomainPackage

public final class VmFactory {
    
    private var dataFactory: DataFactory
    
    public init(dataFactory: DataFactory) {
        self.dataFactory = dataFactory
    }
    
    public func providesFormViewModel() -> FormViewModel {
        FormViewModel(formUseCase: dataFactory.provideFormUseCase())
    }
    
    public func providesStatementViewModel() -> StatementViewModel {
        StatementViewModel(statementUc: dataFactory.provideStatementUseCase())
    }
}
