//
//  RegisterSuccessView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/9/24.
//

import SwiftUI

struct RegisterSuccessView: View {
//    @EnvironmentObject var userData: UserData
    @StateObject private var registerViewModel = RegisterViewModel.shared
    var body: some View {
        
        
        VStack(alignment:.leading){
            
            Text("회원가입이 완료되었습니다!")
                .font(.system(size: 24, weight: .bold))
                .padding(.top,30)
                .padding(.bottom,5)
            
            Text("지금부터 다양한 혜택을 누려보세요")
                .font(.system(size: 16, weight: .regular))
            
            Spacer()
            
            
            RegisterInputView(title:"이름",numberTitle: "휴대폰번호",accountTitle: registerViewModel.userData.mbrNm, accountNumber: registerViewModel.userData.hpNo)
                .padding(.bottom,10)
            RegisterInputView(title:"은행명",numberTitle: "계좌번호",accountTitle: registerViewModel.userData.instNm, accountNumber: registerViewModel.userData.acntNo)
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            NavigationLink(destination: HomeView(), isActive: $isNavigated) {
                Text("다음")
                    .frame(maxWidth:.infinity)
                    .frame(height: 50).foregroundColor(.white)
                    .background(Color.LockPassColor)
                    .cornerRadius(8)
                    .onTapGesture {
                        self.navigateToMainView()
                    }
            }
        }
        .padding(30)
        .navigationBarBackButtonHidden(true)
        .customNavigationBar(
            centerView: {
                Text("가입신청 완료")
            },
            leftView: {
                EmptyView()
            },
            rightView: {
                EmptyView()
            }
        )
    }
    
    @State var isNavigated = false
    
    func navigateToMainView() {
        // navigationStack을 초기화
        isNavigated = true
    }
    
}

#Preview {
    RegisterSuccessView()
//        .environmentObject(UserData())
}
