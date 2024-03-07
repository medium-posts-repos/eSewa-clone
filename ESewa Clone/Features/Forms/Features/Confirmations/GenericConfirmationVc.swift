//
//  GenericConfirmationVc.swift
//  ESewa Clone
//
//  Created by swornim-shah on 24/02/2024.
//

import SwiftUI
import DomainPackage

public struct GenericConfirmationVc: View {
    
    @State private var stateShowConfirmation = false
    public let targetMenu: MenuModel?
    private let onCompletion: TypeCallback<MerchantResponseDto>
    
    public init(targetMenu: MenuModel?, onCompletion: @escaping TypeCallback<MerchantResponseDto>) {
        self.targetMenu = targetMenu
        self.onCompletion = onCompletion
    }
    
    @ObservedObject
    private var formViewModel = AppFactory.shared.vmFactory.providesFormViewModel()
    
    var onEventCallback: ConfirmationEventListener?
    
    public var body: some View {
        VStack(alignment: .leading) {
            List {
                Section {
                    AccountBalanceView()
                }.listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                
                Section {
                    VStack(alignment: .center, spacing: 8) {
                        Text("You are paying")
                            .font(.headline)
                            .fontWeight(.light)
                        AttributedAmountView(currency: "NPR", amount: "500.00", amountFont: .largeTitle, fontColor: .green)
                        Text("Topup")
                            .fontWeight(.bold)
                    }.frame(maxWidth: .infinity, alignment: .center)
                }.modifier(MenuShapeViewModifier(padding: 14))
                    .padding(.init(top: 18, leading: 0, bottom: 18, trailing: 0))
                    .listRowSeparator(.hidden)
                
                Section {
                    FormFieldModel().provideSubmitField()
                        .onTapGesture {
                            self.stateShowConfirmation = true
                        }
                }.listRowSeparator(.hidden)
            }.listStyle(.plain)
                .buildSheet(binding: $stateShowConfirmation) {
                    TxnPinSheetView(isPresented: $stateShowConfirmation) {
                        executeApiOperation(pin: $0)
                    }
                    .presentationDetents([.medium])
                }
        }.modifier(ProgressViewModifier(isLoading: formViewModel.isLoading))
        
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: api operations
extension GenericConfirmationVc {
    private func executeApiOperation(pin: String) {
        let params: RequestParams = [ApiConstants.MERCHANT_CODE: pin]
        
        Task {
            self.formViewModel.executeMerchantApi(code: RouteConstants.ROUTE_ELECTRICITY, params: params, completion: { data in
                
                // TODO: handle failure and success
                var response = MerchantResponseDto()
                
                var destination = MerchantRouteCompletionIntent(routeCode: MenuConstants.MERCHANT_SUCCESS_ROUTE)
                destination.response = response
                destination.targetMenu = targetMenu
                
                onCompletion(response)
            })
        }
    }
}

struct GenericConfirmationVc_Previews: PreviewProvider {
    static var previews: some View {
        GenericConfirmationVc(targetMenu: nil) { _ in }
    }
}

