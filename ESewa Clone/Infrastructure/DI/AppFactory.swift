//
//  Factory.swift
//  Tweetder
//
//  Created by swornim-shah on 02/10/2023.
//

import DomainPackage
import NetworkPackage

public class AppFactory {
    
    private static let appfactory = AppFactory()
    
    public static var shared: AppFactory { get { appfactory } }
    public var vmFactory: VmFactory { get { vmFactoryInstance } }
    public var domainFactory: DataFactory { get { domainFactoryInstance } }
    
    private lazy var domainFactoryInstance = provideDataFactory(networkService: providesNetworkService(), routeProvider: providesRouteProvider())
    
    private lazy var vmFactoryInstance = VmFactory(dataFactory: domainFactoryInstance)
    
    public func providesNetworkService() -> NetworkServiceProtocol { return NetworkService.instance }
    public func providesRouteProvider() -> RouteProvider { return RouteProvider() }

    public func provideDataFactory(networkService: NetworkServiceProtocol, routeProvider: RouteProvider) -> DataFactory {
        DataFactory(networkService: networkService, routeProvider: routeProvider)
    }
}
