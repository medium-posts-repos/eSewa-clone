//
//  TypeAlias.swift
//  ESewa Clone
//
//  Created by swornim-shah on 13/11/2023.
//

import Foundation

public typealias VoidCallback = () -> Void
public typealias TypeCallback<T> = (T) -> Void
public typealias TypeReturnCallback<T> = (T) -> T

public typealias RequestParams = [String: Any]
