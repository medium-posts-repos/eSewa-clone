//
//  File.swift
//  
//
//  Created by swornim-shah on 02/12/2023.


public struct FormItemResponseDto: Codable {
    public var label: String?
    public var type: String?
    public var regex: String?
    
    public init() {}
    
    public var formField: FormFieldModel {
        get {
            let field = FormFieldModel()
            field.label = label
            field.type = .TEXT
            field.regex = regex
            return field
        }
    }
}

extension Array where Element == FormItemResponseDto {
    public var formFields: [FormFieldModel] {
       get {
           return map { $0.formField }
       }
    }
}
