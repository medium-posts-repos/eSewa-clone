//
//  RouterMiddleware.swift
//  ESewa Clone
//
//  Created by swornim-shah on 02/12/2023.
//

import DomainPackage
import FormPackage

public extension Router {
    func routeToFormMiddleware(menu: RouteDestination, onNext: TypeCallback<RouteDestination>) -> Bool {
        guard let _ = FormMenuConfig.menus.first(where: { $0.code == menu.routingCode }) else {
            return false
        }
        
        onNext(menu)
        return true
    }
}
