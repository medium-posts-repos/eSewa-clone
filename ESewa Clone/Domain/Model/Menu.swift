//
//  Menu.swift
//  ESewa Clone
//
//  Created by swornim-shah on 13/11/2023.
//

public struct Menu: Codable, Hashable, Identifiable {
    public var id: Int?
    public var name: String?
    public var desc: String?
    public var iconUrl: String? // remote
    public var iconName: String? // local
    
    public init(id: Int, name: String, desc: String, iconName: String) {
        self.name = name
        self.desc = desc
        self.iconName = iconName
    }
    
    public init() {}
    
    public static var dashboardMenus: [Menu] {
        var menus: [Menu] = []
        menus.append(.init(id: 0, name: "Form", desc: "Topup", iconName: "mobile.fill"))
        menus.append(.init(id: 1, name: "Electricity", desc: "Electricity", iconName: "mobile.fill"))
        menus.append(.init(id: 2, name: "Khanepani", desc: "Khanepani", iconName: "mobile.fill"))
        menus.append(.init(id: 3, name: "eSewa Care", desc: "eSewa Care", iconName: "mobile.fill"))
        menus.append(.init(id: 4, name: "Tihar Daskhina", desc: "Tihar Daskhina", iconName: "mobile.fill"))
        return menus
    }
}
