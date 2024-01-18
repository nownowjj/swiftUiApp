//
//  ChargeOrRefundInputView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/12/24.
//

import SwiftUI

struct ChargeOrRefundInputView: View {
    var title1:String
    var text1:String 
    var title2:String
    var text2:String
    var title3:String
    var text3:String

    
    var body: some View {
        VStack(spacing:20){
            HStack{
                Text("\(title1)        \(text1)")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            HStack{
                Text("\(title2)        \((text2))")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            HStack{
                Text("\(title3)        \(text3)원")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(maxWidth:.infinity)
        .frame(height: 180)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
        .background(Color.InputBack)
        .cornerRadius(8)
    }
}

#Preview {
    ChargeOrRefundInputView(title1: "연결계좌", text1: "카카오뱅크", title2: "계좌번호", text2: "1234-56-123213", title3: "머니잔액", text3: "55,000워")
}
