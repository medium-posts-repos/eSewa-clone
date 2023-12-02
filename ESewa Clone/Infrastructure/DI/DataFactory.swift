//
//  DataFactory.swift
//  Tweetder
//
//  Created by swornim-shah on 02/10/2023.
//

import DomainPackage
import NetworkPackage

public final class DataFactory {
    
    private let networkService: NetworkServiceProtocol
    private let routeProvider: RouteProvider
    
    public init(networkService: NetworkServiceProtocol, routeProvider: RouteProvider) {
        self.networkService = networkService
        self.routeProvider = routeProvider
    }
        
    public func provideFormUseCase() -> FormUseCase {
        FormUseCaseImpl(networkService: networkService)
    }
}
