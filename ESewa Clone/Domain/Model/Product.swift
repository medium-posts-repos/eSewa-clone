//
//  Product.swift
//  ESewa Clone
//
//  Created by swornim-shah on 14/11/2023.
//

import Foundation

public struct Product: Codable, Identifiable, Hashable {
    
    public var id: Int?
    public var name: String?
    public var content: String?
    public var imageUrl: String?
    public var webLink: String?
    
    public init(id: Int, name: String, content: String, imageUrl: String) {
        self.id = id
        self.name = name
        self.content = content
        self.imageUrl = imageUrl
    }
    
    public static var products: [Product] {
        get {
            [
                .init(id: 0, name: "Car on sale", content: "Naya gadi kinus naya ghar paunu hosh", imageUrl: "https://picsum.photos/id/237/200/300"),
                .init(id: 1, name: "Car on sale", content: "Naya gadi kinus naya ghar paunu hosh", imageUrl: "https://picsum.photos/seed/picsum/200/300"),
                .init(id: 2, name: "Car on sale", content: "Naya gadi kinus naya ghar paunu hosh", imageUrl: "https://picsum.photos/id/237/200/300"),
                .init(id: 3, name: "Car on sale", content: "Naya gadi kinus naya ghar paunu hosh", imageUrl: "https://picsum.photos/seed/picsum/200/300"),
                .init(id: 4, name: "Car on sale", content: "Naya gadi kinus naya ghar paunu hosh", imageUrl: "https://picsum.photos/id/237/200/300"),
                .init(id: 5, name: "Car on sale", content: "Naya gadi kinus naya ghar paunu hosh", imageUrl: "https://picsum.photos/id/237/200/300")
            ]
        }
    }
}
