//
//  AmtTextFiledView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/12/24.
//

import SwiftUI

struct AmtTextFiledView: View {
    @Binding var value: Int
    @Binding var formatter: NumberFormatter
    
    var body: some View {
        HStack {
            TextField("0원", value: $value, formatter: formatter)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .keyboardType(.numberPad) // 숫자 패드로 설정
            
            Spacer()
            
            Image(systemName: "xmark.circle")
                .onTapGesture {
                    value = 0
                }
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black, lineWidth: 1)
        )
    }
}
//
//#Preview {
//    AmtTextFiledView()
//}
