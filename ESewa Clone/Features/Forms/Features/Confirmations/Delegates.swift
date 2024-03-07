//
//  Delegates.swift
//  ESewa Clone
//
//  Created by swornim-shah on 07/03/2024.
//

import Foundation

public enum ConfirmationEvent {
    case onTxnSheetSubmitted(pin: String)
}

public typealias ConfirmationEventListener = ((ConfirmationEvent) -> Void)
