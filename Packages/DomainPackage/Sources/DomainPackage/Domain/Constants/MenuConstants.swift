//
//  File.swift
//  
//
//  Created by swornim-shah on 02/12/2023.
//

import Foundation

public struct MenuConstants {
    public static let ELECTRICITY = "ELECTRICITY"
    public static let ELECTRICITY_CONFIRM = "ELECTRICITY_CONFIRM"
    public static let MERCHANT_SUCCESS_ROUTE = "MERCHANT_SUCCESS_ROUTE"
    public static let MERCHANT_FAILURE_ROUTE = "MERCHANT_FAILURE_ROUTE"
}

public struct MerchantFormConfirmationCode {
    public static let codes: [String] = [MenuConstants.ELECTRICITY_CONFIRM]
}

public struct MerchantFormRouteCodes {
    public static let codes: [String] = [MenuConstants.ELECTRICITY]
}
