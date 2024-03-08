//
//  BaseVM.swift
//  Created by swornim-shah on 13/10/2023.
//

import SwiftUI
import Combine
import DomainPackage

@available(iOS 13.0, *)
open class BaseViewModel: ObservableObject {
    
    // Doing this has no effect, since states are related to view only
    // Use @Published instead for observing from non view components
//    @State public var isLoading: Bool = false
    @Published public var isLoading: Bool = false
    @Published public var showAlert: Bool = false
    @Published public var onFailureResult: ApiResDto? = .init()
    
    public lazy var unknownFailure = ApiResDto(title: "Failure", message: "Looks like something went wrong on our side, Retry after some time.")
    
    public lazy var failureResult: PassthroughSubject<ApiResDto, Error> = .init()

    public var cancellables = Set<AnyCancellable>()

    public init() { }
    
}
