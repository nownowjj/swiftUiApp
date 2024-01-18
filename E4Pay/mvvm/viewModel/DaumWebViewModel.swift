//
//  DaumWebViewModel.swift
//  Example
//
//  Created by net e4 on 2023/01/10.
//

import Foundation
import Combine

class DaumWebViewModel: ObservableObject {
    
    @Published var address = Address(jibunAddress: "", roadAddress: "", zonecode: "")
    @Published var isShowingWebView = false
    
    
    let didComplete = PassthroughSubject<DaumWebViewModel, Never>()
    func didTapNext() {
        print("didTapNext")
        didComplete.send(self)
        isShowingWebView = false
    }
    
    enum state{
        case ADDRESS
    }
    
    func action<T> (state: state, param: T, param2: T? = nil){
        switch state{
        case .ADDRESS:
            self.address = param as! Address
            didTapNext()
        }
    }
    
}

