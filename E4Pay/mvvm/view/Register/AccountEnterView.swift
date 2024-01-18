//
//  AccountEnterView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/9/24.
//

import SwiftUI

struct AccountEnterView: View {
    @ObservedObject private var registerViewModel = RegisterViewModel.shared
    
    @StateObject var bankViewModel = BankViewModel()
    
    @State private var showingSheet = false
    @State private var instNm = ""
    var isButtonDisabled: Bool {
        return (registerViewModel.userData.instId.count > 1 && registerViewModel.userData.acntNo.count > 3)
    }
    var body: some View {
        
        
        VStack(alignment:.leading,spacing: 10){
            CommonTopTitleTextView(title: "계좌를 연결해주세요")

            Text("머니에 연결한 은행 및 계좌번호를 등록해주세요")
                .font(.system(size: 16, weight: .regular))
                .padding(.bottom,10)
            
 
            
            // 은행선택
            HStack {
                Text(instNm.count > 1 ? instNm : "은행선택")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundStyle(instNm.count > 1 ? Color.black : Color.gray)
                Spacer()
                
                Image(systemName: "chevron.down")
                    .foregroundColor(Color.black)
                    .font(.system(size: 16, weight: .regular))
            }
            .frame(maxWidth:.infinity)
            .frame(height: 60)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            .background(Color.InputBack)
            .cornerRadius(8)
            .onTapGesture {showingSheet.toggle()}
            .id(registerViewModel.userData.instNm)
            
            
            CommonTextFiledView(placeholder: "계좌번호 입력", text: $registerViewModel.userData.acntNo)
            
            Spacer()
   
            NavigationLink(destination: AccountSuccessView()) {
                Button(action:{},label: {
                    Text("다음")
                        .frame(maxWidth:.infinity)
                        .frame(height: 50).foregroundColor(.white)
                        .background(isButtonDisabled ? Color.LockPassColor : Color.gray)
                        .cornerRadius(8)
                }).disabled(isButtonDisabled)
            }
        }
        .padding(30)
        .navigationBarBackButtonHidden(true)
        .customNavigationBar(
            centerView: {
                Text("계좌정보 입력")
            },
            leftView: {
                ToolbarBackBtnView()
            },
            rightView: {
                EmptyView()
            }
        )
        .onAppear {
            bankViewModel.action(state: .getBank, param: "")
        }
        .sheet(isPresented: $showingSheet) {
            BankListView(isPresented: $showingSheet , bankList: $bankViewModel.bankList) { bankInfo in
                self.instNm = bankInfo.instNm
                registerViewModel.userData.updateInstNm(bankInfo.instNm)
                registerViewModel.userData.instId = bankInfo.instID
            }
        }
    }
}

#Preview {
    NavigationView {
        AccountEnterView()
    }
}




