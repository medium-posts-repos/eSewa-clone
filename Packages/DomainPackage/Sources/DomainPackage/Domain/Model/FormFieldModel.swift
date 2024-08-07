//
//  File.swift
//
//
//  Created by swornim-shah on 02/12/2023.
//

import Foundation

public enum FormFieldType: String, CaseIterable {
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
    case HEADER_CAPTION
    
    static func toType(rawValue: String?) -> FormFieldType? {
        return self.allCases.first{ "\($0)" == rawValue }
    }
}

public final class FormFieldModel: Hashable, Identifiable {
    public var hashId: UUID
    public var tag: String?
    public var regex: String?
    public var label: String?
    public var hint: String?
    public var type: FormFieldType?
    
    public var captionTitle: String?
    public var captionDesc: String?
    
    public var options: [FormOptionDto]?
    
    public init() {
        self.hashId = UUID()
    }
    
    public func hint(text: String) -> Self {
        self.hint = text
        return self
    }
    
    // Hashable conformance
    public func hash(into hasher: inout Hasher) {
        hasher.combine(hashId)
    }
    
    // Equatable conformance (required by Hashable)
    public static func == (lhs: FormFieldModel, rhs: FormFieldModel) -> Bool {
        return lhs.hashId == rhs.hashId
    }
}
