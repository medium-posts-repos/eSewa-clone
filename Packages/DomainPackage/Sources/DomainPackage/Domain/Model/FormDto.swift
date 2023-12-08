//
//  File.swift
//  
//
//  Created by swornim-shah on 02/12/2023.
import Foundation

public struct FormItemResponseDto: Codable {
    public var captionTitle: String?
    public var captionDesc: String?
    public var label: String?
    public var hint: String?
    public var type: String?
    public var regex: String?
    public var options: [FormOptionDto]?
    
    public init() {}
    
    public var formField: FormFieldModel {
        get {
            let field = FormFieldModel()
            field.label = label
            field.captionTitle = captionTitle
            field.captionDesc = captionDesc
            field.hint = hint
            field.type = FormFieldType.toType(rawValue: type) ?? .TEXT
            field.regex = regex
            field.options = options
            return field
        }
    }
}

public struct FormOptionDto: Codable, Hashable {    
    public var hashId: UUID?

    public var label: String?
    public var value: String?
    public var isTxnInvolved: Bool?
    
    public init(label: String?, value: String?, isTxnInvolved: Bool?) {
        self.init()
        self.label = label
        self.value = value
        self.isTxnInvolved = isTxnInvolved
    }
    
    public init() {
        self.hashId = UUID()
    }
    
    // Hashable conformance
    public func hash(into hasher: inout Hasher) {
        hasher.combine(hashId)
    }
    
    // Equatable conformance (required by Hashable)
    public static func == (lhs: FormOptionDto, rhs: FormOptionDto) -> Bool {
        return lhs.hashId == rhs.hashId
    }
    
}

extension Array where Element == FormItemResponseDto {
    public var formFields: [FormFieldModel] {
       get {
           return map { $0.formField }
       }
    }
}
