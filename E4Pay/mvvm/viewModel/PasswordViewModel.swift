//
//  PasswordViewModel.swift
//  E4Pay
//
//  Created by 20-N311 on 1/8/24.
//

import Foundation

class PasswordViewModel: ObservableObject {
    var shuffledArray = [1, 2, 3, 4, 5 , 6, 7 , 8 , 9].shuffled()
//    @EnvironmentObject var userData: UserData
    
    // password  6
    @Published var password = ""
    @Published var firstPassword = ""
    @Published var isNotSame = false
    @Published var isFirstOk = false
    
    @Published var navigateToNextView = false
    
    // MARK: - identification 13
    @Published var identification = ""
    
    // MARK: - card password  4
    @Published var cardPassword = ""
    private var userCardPassword = "1254" // DB 저장된 비밀번호
    @Published var successRegister = false
    
    
    enum state {
        case REGISTER
    }
    
    func setPassword(_ value: String , _ deleteAll: Bool){
        // 0~9가 아닌것들 (초기화 , 지우기)
        if value.count > 1 {
            if deleteAll {
                password.removeAll()
            }else{
                if password.count != 0 {
                    password.removeLast()
                }
            }
        }
        // 숫자를 입력받음 (0~9)
        else{
            // 비밀번호를 6자리까지 받고 6자리에 도달하면 password를 초기화 시켜준다
            print("firstPassword \(firstPassword)")
            
            // Step 1 : 패스워드가 6자리가 아니면 값을 넣음
            if password.count != 6{
                password.append(value)
                
                // Step 2 : 첫번째 비밀번호 set
                if password.count == 6 {
                    // 첫번쨰 비밀번호 채움
                    if firstPassword == ""{
                        firstPassword = password
                        isFirstOk = true
                        password.removeAll()
                    }
                    // 첫번째 비밀번호가 있다면 두번쨰 비밀번호를 받음
                    else{
                        // Step 3 : 비밀번호가 동일하다면 다음 액션
                        if firstPassword == password{
                            navigateToNextView = true
                       
                            // 비밀번호 둘다 일치 회원가입 api 요청
                            
                            
                            
                            
                        }else{
                            isNotSame = true
                            print("틀려")
                        }
                        
                    }
                }
                
            }
        }
    }
    
    
    func resetPassword(){
        print("리셋")
        self.isFirstOk = false
        self.password = ""
        self.firstPassword = ""
        self.isNotSame = false
    }
    
    func setIdentification(_ value: String , _ deleteAll: Bool){
        
        if value.count > 1 {
            if deleteAll {
                // 초기화
                identification.removeAll()
            }else{
                // 하나씩 삭제
                if identification.count != 0 {
                    identification.removeLast()
                }
            }
        }else{
            // 초기화,삭제 아닌 경우 13자리를 다 입력하지 않음
            if identification.count != 13{
                identification.append(value)
            }
        }
        
        // 초기화 , 삭제 , 입력 후에 자리수 체크
        if identification.count == 13{
            navigateToNextView = true
        }else{
            navigateToNextView = false
        }
    }
    
    
    func setCardPassword(_ value: String , _ deleteAll: Bool){
        if value.count > 1 {
            if deleteAll {
                // 초기화
                cardPassword.removeAll()
            }else{
                // 하나씩 삭제
                if cardPassword.count != 0 {
                    cardPassword.removeLast()
                }
            }
        }else{
            // 비밀번호를 받음
            if cardPassword.count != 4{
                cardPassword.append(value) // 넣음
                
                if cardPassword.count == 4{ // 다 넣음
                    if cardPassword == userCardPassword{
                        isNotSame = false
                        successRegister = true
                    }else{
                        isNotSame = true
                    }
                }
            }
        }
    }
    
    
}
