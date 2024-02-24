//
//  TxnPinSheetView.swift
//  ESewa Clone
//
//  Created by swornim-shah on 24/02/2024.
//

import Foundation
import SwiftUI
import DomainPackage

public struct TxnPinSheetView: View {
    public var body: some View {
        VStack {
            Image("ic_profile_view")
                .resizable()
                .clipShape(Circle())
                .frame(width: .xLargeSize, height: .xLargeSize)
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Enter MPIN")
                    .font(.subheadline)
                FormTextFieldView(formField: FormFieldModel())
                    .modifier(FormFieldViewModifier())
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                Spacer().frame(height: 16)
                HStack(alignment: .top) {
                    Image("ic_profile_view")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: .smallSize, height: .smallSize)
                    Text("You can also use Face ID for future transactions. To use, enable it from the settings menu in the app.")
                }.padding(.bottom, 24)
                
                HStack {
                    Button(action: {}, label: {
                        Text("\("Cancel")")
                    }).disabled(true)
                    .buttonStyle(FillButtonStyle())
                    
                    Button(action: {}, label: {
                        Text("\("Cancel")")
                    }).disabled(true)
                    .buttonStyle(PlainButtonStyle())
                }.frame(maxWidth: .infinity, alignment: .center)
            }
        }
            .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}
