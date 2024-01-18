//
//  RegisterViewModel.swift
//  E4Pay
//
//  Created by 20-N311 on 1/17/24.
//

import Foundation
import SwiftUI
import Combine
import OSLog
import Alamofire

//
//class UserData: ObservableObject {
//    @Published var hpNo: String = ""
//    @Published var mbrNm: String = ""
//    @Published var monySertNo: String = ""
//    @Published var instId: String = ""
//    @Published var instNm: String = ""
//    @Published var acntNo: String = ""
//}

class RegisterViewModel: ObservableObject{
    
    static let shared = RegisterViewModel()
    
    @Published var isSuccess = false
    @Published var userData = UserData()
//    @Published var userData = UserData(hpNo: "", mbrNm: "", monySertNo: "", instId: "", instNm: "", acntNo: "")

  
    
    enum state {
        case REGISTER
    }
    
    let didComplete = PassthroughSubject<RegisterViewModel, Never>()
    func didTapNext() {
        didComplete.send(self)
    }
    
    func action<T> (state: state, param: T, param2: T? = nil){
        switch state {
        case .REGISTER:
            register()

            break
        }
    }
    
    private func register(){
        let url: String = RequestUrl.REGISTER.rawValue
        
        let parameters = [
            "uuid"        : UUIDManager.shared.getDeviceUUID(),
            "hpNo"        : userData.hpNo,
            "mbrNm"       : userData.mbrNm,
            "monySertNo"  : userData.monySertNo,
            "instId"      : userData.instId,
            "acntNo"      : userData.acntNo,
        ]
        
        CustomHttpClient<RegisterResponse>().alamofireNetworking(url: url, method: .post , parameters: parameters ) { response in
            Log.debug("UserData : request_Response : {}" , response)
            self.isSuccess = true
            if response.mbrNo != "" {
                UserDefaults.standard.set("mbrNo", forKey: response.mbrNo)
            }
        } onFailure: {
            Log.error("RegisterViewModel request_onFailure")
        }
    }
    
}


struct RegisterResponse: Codable {
    let rpsCatgCD, rpsCD, rpsMsg, mbrNo: String

    enum CodingKeys: String, CodingKey {
        case rpsCatgCD = "rpsCatgCd"
        case rpsCD = "rpsCd"
        case rpsMsg, mbrNo
    }
}
