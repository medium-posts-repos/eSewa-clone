//
//  FormUseCaseMockImpl.swift
//  ESewa Clone
//
//  Created by swornim-shah on 21/02/2024.
//

import Foundation
import DomainPackage
import Combine
import NetworkPackage

public final class FormUseCaseMockImpl: FormUseCase {
    public func executeMerchantApi(code: String, params: RequestParams) -> AnyPublisher<BaseResponseDto<MerchantResponseDto>, Error> {
        return Future<BaseResponseDto<MerchantResponseDto>, Error> { promise in
            var response = BaseResponseDto<MerchantResponseDto>()
            response.data = .init()
            
            promise(.success(response))
        }.delay(for: 1.5, scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    public func executeGet(code: String, params: RequestParams) -> AnyPublisher<BaseResponseDto<[FormItemResponseDto]>, Error> {
        let mockFormJsonString = """
                    {
                      "status": true,
                      "message": "Fetch forms",
                      "data": [
                        {
                          "label": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                          "hint": "Eg CA23423",
                          "type": "NOTE",
                          "regex": ""
                        },
                        {
                          "hint": "Eg CA23423",
                          "type": "HEADER_CAPTION",
                          "regex": "",
                          "captionTitle": "Personal Information",
                          "captionDesc": "Update your personal details below"
                        },
                        {
                          "label": "Card Id. ",
                          "hint": "Eg CA23423",
                          "type": "TEXT",
                          "regex": ""
                        },
                        {
                          "label": "User Customer Id. ",
                          "hint": "CA23423",
                          "type": "TEXT",
                          "regex": ""
                        },
                        {
                          "label": "Date of Birth",
                          "hint": "YYYY/MM/DD",
                          "type": "TEXT",
                          "regex": ""
                        },
                        {
                          "label": "Amount",
                          "type": "AMOUNT",
                          "hint": "Enter amount here",
                          "regex": ""
                        },
                        {
                          "label": "Select occupation",
                          "type": "DROPDOWN",
                          "hint": "",
                          "regex": "",
                          "options": [
                            {
                              "label": "Teacher",
                              "value": "001"
                            },
                            {
                              "label": "Business",
                              "value": "001"
                            },
                            {
                              "label": "Doctor",
                              "value": "001"
                            },
                            {
                              "label": "Management",
                              "value": "001"
                            },
                            {
                              "label": "Developer",
                              "value": "001"
                            },
                            {
                              "label": "Operations",
                              "value": "001"
                            }
                          ]
                        },
                        {
                          "label": "Submit",
                          "hint": "",
                          "type": "SUBMIT",
                          "regex": ""
                        }
                      ]
                    }
                    """
        
        // MARK: `Future` alternate solution is to use `Defered`
        return Future<BaseResponseDto<[FormItemResponseDto]>, Error> { promise in
            do {
                let baseResponse = try JSONDecoder().decode(BaseResponseDto<[FormItemResponseDto]>.self, from: mockFormJsonString.data(using: .utf8)!)
                promise(.success(baseResponse))
            } catch {
                promise(.failure(error))
            }
        }.delay(for: 1.5, scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
