//
//  BankViewModel.swift
//  E4Pay
//
//  Created by 20-N311 on 1/17/24.
//

import Foundation
import SwiftUI
import Combine
import OSLog
import Alamofire


class BankViewModel: ObservableObject{
    static let shared = BankViewModel()
    
    @Published var bankList = [BankList]()
    
    
    enum state {
        case getBank
    }
    
    
    let didComplete = PassthroughSubject<BankViewModel, Never>()
    func didTapNext() {
        didComplete.send(self)
    }
    
    
    func action<T> (state: state, param: T, param2: T? = nil){
        switch state {
        case .getBank:
            getBankList()
            
            didTapNext()
            break
        }
    }
    
    
    // check uuid api 요청
    private func getBankList(){
        let url: String = RequestUrl.BANKLIST.rawValue
        Log.debug("BankViewModel : request_url : {}" , url)

        
        CustomHttpClient<Bank>().alamofireNetworking(url: url, method: .get) { [weak self] bankInfo in
            Log.debug("BankViewModel : request_Response : {}" , bankInfo)
            self?.bankList = bankInfo.lists
        } onFailure: {
           
        }//alamofire
    }
}
