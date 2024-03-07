//
//  RouteViewExt.swift
//  SnapBank
//
//  Created by swornim-shah on 28/09/2023.
//

import SwiftUI
import DomainPackage
import FormPackage

public protocol RoutableIntentProtocol: Hashable {
    var routeCode: String? { get set }
}

public struct RouteIntentDto: RoutableIntentProtocol {
    public var routeMenu: MenuModel?
    public var routeCode: String?
    
    public var formFields: [FormFieldModel]?
    
    public var routingCode: String? {
        get {
            routeCode ?? routeMenu?.code
        }
    }
    
    public var routingTitle: String? {
        get {
            routeMenu?.name
        }
    }
}
