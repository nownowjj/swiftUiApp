//
//  RefundView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/12/24.
//

import SwiftUI

struct RefundView: View {
    @StateObject var viewModel = ChargeOrRefundViewModel()
    @State private var amountFormatter = FormatterProvider.createAmountFormatter()
    var haveMoney:Int = 1000
    
    // 보유한 금액이 입력한 금액보다 크면 true
    var isRefundPossible: Bool {
        return viewModel.chargeAmt <= haveMoney
    }
    
    
    var body: some View {
        VStack(alignment:.leading, spacing:20 ){
            CommonTopTitleTextView(title: "환불금액을 입력하세요")
            
            AmtTextFiledView(value : $viewModel.chargeAmt , formatter: $amountFormatter)
            
            VStack(alignment:.leading){
                Text("보유머니 잔액: \(haveMoney)원")
                
                if !isRefundPossible {
                    Text("환불 불가 (보유머니 잔액 부족)")
                        .foregroundStyle(Color.red)
                }
            }
            
            
            
            RegisterInputView(title:"환불계좌",numberTitle: "카카오뱅크",accountTitle: "", accountNumber: "1234-213-213213")
                .padding(.bottom,10)
            
            
            Spacer()
            
            HStack(alignment: .center) {
                NavigationLink(destination: ChargeOrRefundSuccessView(sourceView: .refund)) {
                    Button(action: {}) {
                        Text("환불하기")
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .foregroundColor(.white)
                            .background(viewModel.chargeAmt == 0 || !isRefundPossible ? Color.gray : Color.LockPassColor)
                    }.disabled(viewModel.chargeAmt == 0 || !isRefundPossible  ? false : true)
                }
            }.cornerRadius(8)
        }
        .padding(30)

        .customNavigationBar(
            centerView: {
                Text("환불하기")
            },
            leftView: {
                ToolbarBackBtnView()
            },
            rightView: {
                EmptyView()
            }
        )
    }
}

#Preview {
    RefundView()
}
