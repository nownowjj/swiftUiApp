//
//  AccountSuccess.swift
//  E4Pay
//
//  Created by 20-N311 on 1/9/24.
//

import SwiftUI

struct AccountSuccessView: View {
//    @EnvironmentObject var userData: UserData
    @StateObject private var registerViewModel = RegisterViewModel.shared
    var body: some View {
        
        
        VStack(alignment:.leading){
            
            Text("계좌연결이 완료되었습니다.")
                .font(.system(size: 24, weight: .bold))
                .padding(.top,30)
                .padding(.bottom,5)
            
            Text("등록된 은행 및 계좌번호를 확인해주세요")
                .font(.system(size: 16, weight: .regular))
            
            Spacer()
            
            
            VStack(spacing:20){
                HStack{
//                    Text("은행명        \(userData.instNm)")
                    Text("은행명        \(registerViewModel.userData.instNm)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                HStack{
//                    Text("계좌번호     \(userData.acntNo)")
                    Text("계좌번호     \(registerViewModel.userData.acntNo)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .frame(maxWidth:.infinity)
            .frame(height: 120)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
            .background(Color.InputBack)
            .cornerRadius(8)
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            NavigationLink(destination: PasswordView()) {
                Text("다음")
                    .frame(maxWidth:.infinity)
                    .frame(height: 50).foregroundColor(.white)
                    .background(Color.LockPassColor)
                    .cornerRadius(8)
            }
        }
        .padding(30)
        .navigationBarBackButtonHidden(true)
        .customNavigationBar(
            centerView: {
                Text("계좌연결 완료")
            },
            leftView: {
                ToolbarBackBtnView()
            },
            rightView: {
                EmptyView()
            }
        )
    }
}

struct AccountSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        AccountSuccessView()
//            .environmentObject(UserData())
    }
}
