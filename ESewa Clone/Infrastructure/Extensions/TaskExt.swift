//
//  TaskExtensions.swift
//  ESewa Clone
//
//  Created by swornim-shah on 02/12/2023.
//

import Combine

public extension Task {
    func store(in set: inout Set<AnyCancellable>) {
        set.insert(AnyCancellable(cancel))
    }
}
