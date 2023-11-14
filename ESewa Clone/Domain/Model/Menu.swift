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
        menus.append(.init(id: 5, name: "Internet", desc: "Internet", iconName: "mobile.fill"))
        menus.append(.init(id: 6, name: "Airliness", desc: "Airliness", iconName: "mobile.fill"))
        menus.append(.init(id: 7, name: "Intl Airliness", desc: "Intl Airliness", iconName: "mobile.fill"))
        menus.append(.init(id: 7, name: "Request Money", desc: "Request Money", iconName: "mobile.fill"))
        menus.append(.init(id: 7, name: "Hotels", desc: "Hotels", iconName: "mobile.fill"))
        menus.append(.init(id: 7, name: "Govt. Payment", desc: "Govt. Payment", iconName: "mobile.fill"))
        menus.append(.init(id: 7, name: "Cable Car", desc: "Cable Car", iconName: "mobile.fill"))
        menus.append(.init(id: 7, name: "Sahakari Deposit", desc: "Sahakari Deposit", iconName: "mobile.fill"))
        menus.append(.init(id: 7, name: "TV", desc: "TV", iconName: "mobile.fill"))
        menus.append(.init(id: 7, name: "Education Fee", desc: "Education Fee", iconName: "mobile.fill"))
        menus.append(.init(id: 7, name: "Insurance", desc: "Insurance", iconName: "mobile.fill"))
        menus.append(.init(id: 7, name: "ATM Withdraw", desc: "ATM Withdraw", iconName: "mobile.fill"))
        menus.append(.init(id: 7, name: "Financial Services", desc: "Financial Services", iconName: "mobile.fill"))
        menus.append(.init(id: 7, name: "Health", desc: "Health", iconName: "mobile.fill"))
        menus.append(.init(id: 7, name: "Bus Ticket", desc: "Bus Ticket", iconName: "mobile.fill"))
        menus.append(.init(id: 7, name: "Movies", desc: "Movies", iconName: "mobile.fill"))
        menus.append(.init(id: 7, name: "Voting & Events", desc: "Voting & Events", iconName: "mobile.fill"))
        menus.append(.init(id: 7, name: "Online Payment", desc: "Online Payment", iconName: "mobile.fill"))
        menus.append(.init(id: 7, name: "Antivirus", desc: "Antivirus", iconName: "mobile.fill"))
        menus.append(.init(id: 7, name: "Antivirus", desc: "Antivirus", iconName: "mobile.fill"))
        menus.append(.init(id: 8, name: "Antivirus", desc: "Antivirus", iconName: "mobile.fill"))
        menus.append(.init(id: 9, name: "Antivirus", desc: "Antivirus", iconName: "mobile.fill"))
        return menus
    }
}
