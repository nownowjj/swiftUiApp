//
//  ChargeOrRefundViewModel.swift
//  E4Pay
//
//  Created by 20-N311 on 1/12/24.
//

import Foundation


class FormatterProvider {
    static func createAmountFormatter() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        formatter.usesGroupingSeparator = true
        return formatter
    }
}


class ChargeOrRefundViewModel: ObservableObject {
    @Published var chargeAmt:Int = 0
    var amountFormatter: NumberFormatter = FormatterProvider.createAmountFormatter()
    
    
    // 문자열에서 금액을 추출하고, 만원 단위로 변환하는 함수
    func extractAmount(from text: String) -> Int? {
        let amountString = text.trimmingCharacters(in: CharacterSet(charactersIn: "+"))
        let amountString2 = amountString.trimmingCharacters(in: CharacterSet(charactersIn: "만원"))
        
        if let amount = Int(amountString2) {
            return amount * 10000 // 만원 단위로 변환
        }
        return nil
    }
}


