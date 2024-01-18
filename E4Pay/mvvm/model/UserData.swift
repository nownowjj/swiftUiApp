import SwiftUI

import Foundation

import Combine
import OSLog
import Alamofire

class UserData: ObservableObject {
    @Published var hpNo: String  = ""   // 전화번호
    @Published var mbrNm: String   = ""  // 사용자명
    @Published var monySertNo: String  = "" // 패스워드
    @Published var instId: String  = ""// 선택 기관 Id
    @Published var instNm: String = "" {
        didSet {
            objectWillChange.send()
        }
    }
//    @Published var instNm: String  = "" // 선택 기관명
    @Published var acntNo: String   = "" // 계좌번호
    
    
    
    
    // 추가된 메서드
    func updateInstNm(_ newValue: String) {
        instNm = newValue
    }
    

}
