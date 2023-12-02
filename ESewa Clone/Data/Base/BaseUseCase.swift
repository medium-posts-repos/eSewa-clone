//
//  BaseUseCase.swift
//  ESewa Clone
//
//  Created by swornim-shah on 02/12/2023.
//

import DomainPackage
import NetworkPackage

open class BaseUseCase {
    
    public let networkService: NetworkServiceProtocol
    
    public init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
}
