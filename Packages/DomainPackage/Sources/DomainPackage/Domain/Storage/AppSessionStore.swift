//
//  AppSessionStore.swift
//
//
//  Created by swornim-shah on 25/10/2023.
//

public struct AppSessionStore {
    
    public static var shared = AppSessionStore()
    
    public var sessionToken: String?
    
    private init() {}
}
