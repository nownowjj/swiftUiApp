//
//  ContentController.swift
//  E4Pay
//
//  Created by 20-N311 on 1/14/24.
//

import Foundation
import WebKit

class ContentController: NSObject, WKScriptMessageHandler {
    private var daumWebViewModel: DaumWebViewModel

    init(daumWebViewModel: DaumWebViewModel) {
        self.daumWebViewModel = daumWebViewModel
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        // 웹뷰에서 주소를 선택하여 callBackHandler 데이터 넘김
        if message.name == "callBackHandler" {
            print("message name : \(message.name)")
            print("post Message : \(message.body)")
            
            if let data = message.body as? [String: Any],
               let jibunAddress = data["jibunAddress"] as? String,
               let roadAddress = data["roadAddress"] as? String,
               let zonecode = data["zonecode"] as? String{
                let address = Address(jibunAddress: jibunAddress, roadAddress: roadAddress, zonecode: zonecode)
                daumWebViewModel.action(state: .ADDRESS, param: address)
            }
        }
    }
}
