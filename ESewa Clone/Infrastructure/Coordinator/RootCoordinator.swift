//
//  RootCoordinator.swift
//  ESewa Clone
//
//  Created by swornim-shah on 22/02/2024.
//

import SwiftUI
import UIKit

public class RootCoordinator: Coordinating {
    
    public var navigationController: UINavigationController?
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
//        let hostingController = UIHostingController(rootView: GenericFormScreen(formFields: []))
//        navigationController?.pushViewController(hostingController, animated: true)
    }
}
