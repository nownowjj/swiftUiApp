//
//  ChangeCardPasswordView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/16/24.
//

import SwiftUI

struct ChangeCardPasswordView: View {
    @State var password:String = ""
    @State var retryPassword:String = ""
    @State var nextPossible:Bool = false
    @State var showError: Bool = false
    @State var isPresented: Bool = false
    @State var isNavigate: Bool = false
    @State var cardCvc:String = ""
    
    var body: some View {
        VStack(alignment:.leading, spacing:20 ){
            CommonTopTitleTextView(title: "변경할 카드 비밀번호\n4자리를 입력해주세요")
            
            HStack {
                SecureField("비밀번호", text: $password)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .keyboardType(.numberPad)
                    .onChange(of: password) { newValue in
                        if newValue.count > 4 {
                            password = String(newValue.prefix(4))
                        }
                        updateNextPossible()
                    }
                
                Spacer()
                
                Image(systemName: "xmark.circle")
                    .onTapGesture {
                        password = ""
                    }
            }
            .frame(maxWidth:.infinity)
            .frame(height: 60)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            .background(Color.InputBack)
            .cornerRadius(8)
            
            
            SecureField("비밀번호 확인", text: $retryPassword)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .keyboardType(.numberPad)
                .onChange(of: retryPassword) { newValue in
                    if newValue.count > 4 {
                        retryPassword = String(newValue.prefix(4))
                    }
                    updateNextPossible()
                }
                .frame(maxWidth:.infinity)
                .frame(height: 60)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                .background(Color.InputBack)
                .cornerRadius(8)
        
            if showError {
                Text("다시 한번 같은 비밀번호를 입력해주세요")
            }

            SecureField("CVC 및 CW 번호 (카드 뒷면 3자리)", text: $cardCvc)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .keyboardType(.numberPad)
                .onChange(of: cardCvc) { newValue in
                    if newValue.count > 3 {
                        cardCvc = String(newValue.prefix(3))
                    }
                }
                .frame(maxWidth:.infinity)
                .frame(height: 60)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                .background(Color.InputBack)
                .cornerRadius(8)
            
            Spacer()
            
            
            Button(action: {isPresented.toggle()} ,label: {
                Text("확인")
                    .frame(maxWidth:.infinity)
                    .frame(height: 50).foregroundColor(.white)
                    .background(isAllSuccess ? Color.LockPassColor : Color.gray)
                    .cornerRadius(8)
            }).disabled(!isAllSuccess)
            
        }
        .padding(30)
        .customNavigationBar(
            centerView: {
                Text("카드 비밀번호 변경")
            },
            leftView: {
                ToolbarBackBtnView()
            },
            rightView: {
                EmptyView()
            }
        )
        .customAlert(isPresented: $isPresented){
            CustomAlertView(title: "",
                            content: "카드비밀번호\n변경이 완료되었습니다.",
                            textAlignment: .center,
                            confimBtn: {CustomAlertButtonView(type: .CONFIRM , isPresented: $isPresented) {
                                        self.isNavigate.toggle()
                                    }
                            })
        }
        .background(
            NavigationLink(
                destination: HomeView(),
                isActive: $isNavigate
            ) {
                EmptyView()
            }
        )
    }
    
    var isAllSuccess: Bool {
        return nextPossible && cardCvc.count == 3
    }
    
    private func updateNextPossible() {
        if password == retryPassword {
            nextPossible = true
            showError = false
        } else {
            nextPossible = false
            showError = true
        }
    }
}

#Preview {
    ChangeCardPasswordView()
}
