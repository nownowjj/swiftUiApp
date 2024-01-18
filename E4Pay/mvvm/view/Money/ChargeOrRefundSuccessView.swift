//
//  MoneyChargeSuccessView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/12/24.
//

import SwiftUI


enum SourceView {
    case refund
    case moneyCharge
}

struct ChargeOrRefundSuccessView: View {
    var sourceView: SourceView
    var isFromRefund: Bool {
        return sourceView == .refund
    }

    
    var body: some View {
        VStack(spacing:20){
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 80,height: 80)
                .foregroundColor(Color.green)

            VStack{
                CommonTopTitleTextView(title: "\(isFromRefund ? "고객님 계좌로" : "E4.PAY. 머니로")")
                CommonTopTitleTextView(title: "\("50,000")원 \(isFromRefund ? "환불" : "충전")완료").foregroundColor(Color.blue)
            }
            
            
            ChargeOrRefundInputView(title1: "연결계좌", text1: "카카오뱅크", title2: "계좌번호", text2: "1234-56-123213", title3: "머니잔액", text3: "55,000")
                .padding(.bottom,10)
            
            Spacer()
            
            NavigationLink(destination: HomeView()) {
                Text("확인")
                    .frame(maxWidth:.infinity)
                    .frame(height: 50).foregroundColor(.white)
                    .background(Color.LockPassColor)
                    .cornerRadius(8)
            }
        }
        .padding(30)
        .customNavigationBar(
            centerView: {
                Text(isFromRefund ? "환불완료" : "충전완료")
            },
            leftView: {
                EmptyView()
            },
            rightView: {
                EmptyView()
            }
        )
    }
}

#Preview {
    ChargeOrRefundSuccessView(sourceView: .refund)
}
