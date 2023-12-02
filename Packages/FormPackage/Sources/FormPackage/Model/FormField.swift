//
//  File.swift
//  
//
//  Created by swornim-shah on 02/12/2023.
//

import Foundation

public enum FormFieldType {
    case TEXT
    case NUMBER
    case AMOUNT
    case DROPDOWN
    case SUBMIT
    case CHECKBOX
    case DISCLAIMER
    case WEBVIEW
    case NOTE
    case TEXT_AREA
}

public final class FormField: Hashable, Identifiable {
    public var hashId: UUID
    public var tag: String?
    public var regex: String?
    public var label: String?
    public var type: FormFieldType?
    
    public init() {
        self.hashId = UUID()
    }
    
    // Hashable conformance
    public func hash(into hasher: inout Hasher) {
        hasher.combine(hashId)
    }
    
    // Equatable conformance (required by Hashable)
    public static func == (lhs: FormField, rhs: FormField) -> Bool {
        return lhs.hashId == rhs.hashId
    }
}
