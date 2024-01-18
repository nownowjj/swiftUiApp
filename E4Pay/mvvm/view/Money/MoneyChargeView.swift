//
//  MoneyChargeView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/11/24.
//

import SwiftUI

struct MoneyChargeView: View {
    @StateObject var viewModel = ChargeOrRefundViewModel()
    @State private var amountFormatter = FormatterProvider.createAmountFormatter()
    
    @State var shuffledArray = ["+1만원", "+3만원","+5만원","+10만원"]
    
    var body: some View {
        VStack(alignment:.leading, spacing:20 ){
            CommonTopTitleTextView(title: "충전금액을 입력하세요")
            
            AmtTextFiledView(value : $viewModel.chargeAmt , formatter: $amountFormatter)
            
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 0) {
                ForEach(shuffledArray , id: \.self){value in
                    Button(action: {
                        // 클릭된 금액을 chargeAmt에 추가
                        if let amount = viewModel.extractAmount(from: value) {
                            viewModel.chargeAmt += amount
                        }
                    }) {
                        Text(value)
                            .foregroundStyle(Color.black)
                            .frame(width: 60, height: 20)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                    
                }
            }
            
            
            RegisterInputView(title:"연결계좌",numberTitle: "카카오뱅크",accountTitle: "", accountNumber: "1234-213-213213")
                .padding(.bottom,10)
            
            
            Spacer()
            
            HStack(alignment: .center) {
                NavigationLink(destination: ChargeOrRefundSuccessView(sourceView: .moneyCharge)) {
                    Button(action: {}) {
                        Text("충전하기")
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .foregroundColor(.white)
                            .background(viewModel.chargeAmt < 10000 ? Color.gray : Color.LockPassColor)
                    }.disabled(viewModel.chargeAmt < 10000 ? false : true)
                }
            }.cornerRadius(8)
        }
        .padding(30)
        .customNavigationBar(
            centerView: {
                Text("충전하기")
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
    MoneyChargeView()
}
