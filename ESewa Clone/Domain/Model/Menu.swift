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
    public var iconName: String? // local
    public var iconUrl: String? // remote
    
    public init(id: Int, name: String, desc: String, iconName: String) {
        self.name = name
        self.desc = desc
        self.iconName = iconName
    }
    
    public init(id: Int, name: String, desc: String, iconUrl: String) {
        self.name = name
        self.desc = desc
        self.iconUrl = iconUrl
    }
    
    public init() {}
    
    public static var dashboardMenus: [Menu] {
        var menus: [Menu] = []
        menus.append(.init(id: 0, name: "Form Builder", desc: "Topup", iconName: "mobile.fill"))
        menus.append(.init(id: 1, name: "Electricity NEA", desc: "Electricity", iconName: "mobile.fill"))
        menus.append(.init(id: 2, name: "Khanepani Water", desc: "Khanepani", iconName: "mobile.fill"))
        menus.append(.init(id: 3, name: "eSewa Care", desc: "eSewa Care", iconName: "mobile.fill"))
        menus.append(.init(id: 4, name: "Tihar Daskhina", desc: "Tihar Daskhina", iconName: "mobile.fill"))
        menus.append(.init(id: 5, name: "Internet Company", desc: "Internet", iconName: "mobile.fill"))
        menus.append(.init(id: 6, name: "Airliness Clinet", desc: "Airliness", iconName: "mobile.fill"))
        menus.append(.init(id: 7, name: "Intl Airliness", desc: "Intl Airliness", iconName: "mobile.fill"))
        menus.append(.init(id: 8, name: "Request Money", desc: "Request Money", iconName: "mobile.fill"))
        menus.append(.init(id: 9, name: "Hotels Room", desc: "Hotels", iconName: "mobile.fill"))
        menus.append(.init(id: 10, name: "Govt. Payment", desc: "Govt. Payment", iconName: "mobile.fill"))
        menus.append(.init(id: 11, name: "Cable Car", desc: "Cable Car", iconName: "mobile.fill"))
        menus.append(.init(id: 12, name: "Sahakari Deposit", desc: "Sahakari Deposit", iconName: "mobile.fill"))
        menus.append(.init(id: 13, name: "TV Subscriber", desc: "TV", iconName: "mobile.fill"))
        menus.append(.init(id: 14, name: "Education Fee", desc: "Education Fee", iconName: "mobile.fill"))
        menus.append(.init(id: 15, name: "Insurance", desc: "Insurance", iconName: "mobile.fill"))
        menus.append(.init(id: 16, name: "ATM Withdraw", desc: "ATM Withdraw", iconName: "mobile.fill"))
        menus.append(.init(id: 17, name: "Financial Services", desc: "Financial Services", iconName: "mobile.fill"))
        menus.append(.init(id: 18, name: "Health Insurance", desc: "Health", iconName: "mobile.fill"))
        menus.append(.init(id: 19, name: "Bus Ticket", desc: "Bus Ticket", iconName: "mobile.fill"))
        menus.append(.init(id: 20, name: "Movies Time", desc: "Movies", iconName: "mobile.fill"))
        menus.append(.init(id: 21, name: "Voting & Events", desc: "Voting & Events", iconName: "mobile.fill"))
        menus.append(.init(id: 22, name: "Online Payment", desc: "Online Payment", iconName: "mobile.fill"))
        menus.append(.init(id: 23, name: "Antivirus", desc: "Antivirus", iconName: "mobile.fill"))
        return menus
    }
    
    public static var offerMenus: [Menu] {
        var menus: [Menu] = []
        menus.append(.init(id: 0, name: "School Fees Money", desc: "Topup", iconUrl: "mobile.fill"))
        menus.append(.init(id: 1, name: "College Fees Transfer", desc: "Electricity", iconUrl: "mobile.fill"))
        menus.append(.init(id: 2, name: "Khanepani Water", desc: "Khanepani", iconUrl: "mobile.fill"))
        menus.append(.init(id: 3, name: "eSewa Care Community", desc: "eSewa Care", iconUrl: "mobile.fill"))
        menus.append(.init(id: 4, name: "Tihar Daskhina", desc: "Tihar Daskhina", iconUrl: "mobile.fill"))
        menus.append(.init(id: 9, name: "Antivirus Software", desc: "Antivirus", iconUrl: "mobile.fill"))
        return menus
    }
    
    public static var helpAndSupportMenus: [Menu] {
        return [
            .init(id: 0, name: "Meroshare / Demat", desc: "Payment not updated, Double Payment", iconUrl: "mobile.fill"),
            .init(id: 1, name: "Mobile Top-up", desc: "Mistake Top-up, Amount not updated", iconUrl: "mobile.fill"),
            .init(id: 2, name: "Account Link", desc: "Unable to link", iconUrl: "mobile.fill"),
            .init(id: 3, name: "Government Payment", desc: "Amount not updated, Mistake payment", iconUrl: "mobile.fill")
        ]
    }
}
