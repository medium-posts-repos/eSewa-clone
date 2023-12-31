//
//  BaseVM.swift
//  Created by swornim-shah on 13/10/2023.
//

import SwiftUI
import Combine

@available(iOS 13.0, *)
open class BaseViewModel: ObservableObject {
    
    // Doing this has no effect, since states are related to view only
    // Use @Published instead for observing from non view components
//    @State public var isLoading: Bool = false
    @Published public var isLoading: Bool = false

    public var cancellables = Set<AnyCancellable>()

    public init() { }
    
}
