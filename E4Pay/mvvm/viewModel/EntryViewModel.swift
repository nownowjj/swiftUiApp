//
//  EntryViewModel.swift
//  E4Pay
//
//  Created by 20-N311 on 1/17/24.
//

import Foundation
import SwiftUI
import Combine
import OSLog
import Alamofire


class EntryViewModel: ObservableObject{
    
    @Published var isAvailableUUid:Bool = false
    
    enum state {
        case autoLogin
    }
    
    
    let didComplete = PassthroughSubject<EntryViewModel, Never>()
    func didTapNext() {
        didComplete.send(self)
    }
    
    
    func action<T> (state: state, param: T, param2: T? = nil){
        switch state {
        case .autoLogin:
            // step 1 uuid 가져옴
            let uuid = UUIDManager.shared.getDeviceUUID()
            Log.debug("EntryViewModel : uuid : " , uuid)
            // step 2 가져온 uuid 유효한지 api 요청
            checkUUid(uuid: uuid)
            
            // step 3 api 요청에 따른 Bool을 isAvailableUUid에 할당
            
            
            break
        }
    }
    
    
    // check uuid api 요청
    private func checkUUid(uuid: String){
        let url: String = RequestUrl.CHECK_UUID.rawValue + "?uuid=" + uuid
        Log.debug("EntryViewModel url : " , "\(url)")

        
        CustomHttpClient<CheckUUidResponse>().alamofireNetworking(url: url, method: .get) { response in
            Log.debug("EntryViewModel request_Response :" , response)
            
            if(response.exsist){
                Log.debug("EntryViewModel autoLogin  " , response)
                self.isAvailableUUid = true
                if response.mbrNo != nil {
                    UserDefaults.standard.set("mbrNo", forKey: response.mbrNo!)
                }
            }
            else{
                Log.error("EntryViewModel request success but not UUID  " , response)
                self.isAvailableUUid = false
            }
        } onFailure: {
            Log.error("EntryViewModel request_onFailure")
            self.isAvailableUUid = false
        }
    }
    
}


struct CheckUUidResponse: Codable {
    let mbrNo: String?
    let exsist: Bool
}








