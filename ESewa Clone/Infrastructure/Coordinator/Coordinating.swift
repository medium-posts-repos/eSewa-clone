//
//  Coordinating.swift
//  ESewa Clone
//
//  Created by swornim-shah on 22/02/2024.
//

import Foundation
import UIKit

public protocol Coordinating: AnyObject {
    var navigationController: UINavigationController? { get set }
    func start()
}
