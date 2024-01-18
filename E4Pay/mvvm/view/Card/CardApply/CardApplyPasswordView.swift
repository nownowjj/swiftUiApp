//
//  CardApplyPasswordView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/15/24.
//

import SwiftUI

struct CardApplyPasswordView: View {
    @State private var password:String = ""
    @State private var retryPassword:String = ""
    @State private var nextPossible:Bool = false
    @State private var showError: Bool = false
    
    var body: some View {
        VStack(alignment:.leading, spacing:20 ){
            CommonTopTitleTextView(title: "카드 비밀번호\n4자리를 입력해주세요")
            
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

            
            Spacer()
            
            NavigationLink(destination: CardApplySuccessView()) {
                Button(action:{},label: {
                    Text("다음")
                        .frame(maxWidth:.infinity)
                        .frame(height: 50).foregroundColor(.white)
                        .background(nextPossible ? Color.LockPassColor : Color.gray)
                        .cornerRadius(8)
                }).disabled(nextPossible)
            }
        }
        .padding(30)
        .customNavigationBar(
            centerView: {
                Text("카드 비밀번호 등록")
            },
            leftView: {
                ToolbarBackBtnView()
            },
            rightView: {
                EmptyView()
            }
        )
        .onChange(of: retryPassword) { _ in
            updateNextPossible()
        }
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
    CardApplyPasswordView()
}
