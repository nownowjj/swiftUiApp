//
//  CertView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/5/24.
//

import SwiftUI

struct CertView: View {
    @StateObject private var registerViewModel = RegisterViewModel.shared
    
    @State var certNumber:String = ""    // 입력한 인증코드
    
    @State var certResultNumber:String = "111"  // 서버에서 받은 인증코드
    
    @State private var isCertOk:Bool = false    // 코드 확인 여부
    
    @State private var isShowingAlert = false
    @State private var checkMessage = ""
    
    
    @State private var isAlreadyUser = false
    @State private var isNavigate:Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            Text("E4.Pay 본인 인증")
                .font(.system(size: 24, weight: .bold))
            
            Text("이포페이를 시작하기위해 본인인증을 해주세요")
                .padding(.top,1)
                .lineLimit(1)
                .font(.system(size: 14, weight: .regular))
            
            Spacer()
            TextField("이름 입력",text: $registerViewModel.userData.mbrNm)
                .frame(maxWidth:325)
                .frame(height: 60)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                .background(Color.InputBack)
                .cornerRadius(8)
            
            HStack(spacing: 0) {
                TextField("휴대폰 번호 입력", text: $registerViewModel.userData.hpNo)
                    .frame(maxWidth: 225)
                    .frame(height: 60)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    .background(Color.InputBack)
                    .keyboardType(.numberPad)
                
                Button(action: {
                    sendCertCheck()
                }) {
                    Text("인증코드 전송")
                }
                .frame(maxWidth: 100)
                .frame(height: 60)
                .foregroundColor(.white)
                .background(Color.Dark1c262a)
                .font(.system(size: 12))
            }
            .frame(maxWidth: .infinity)
            .cornerRadius(8)
            
            
            
            HStack(spacing:0){
                TextField("전송받은 코드",text: $certNumber)
                    .frame(maxWidth: 225)
                    .frame(height: 60)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    .background(Color.InputBack)
                
                Button(action: {
                    checkCode()
                }, label:{
                    Text("코드 확인")
                })
                .frame(width: 100 ,height:60).foregroundColor(.white).background(Color.Dark1c262a).font(.system(size: 14))
            }
            .cornerRadius(8)
            
            
            Text(checkMessage)
                .foregroundStyle(isCertOk ? Color.blue : Color.red)
            
            Text("3분 이내에 인증코드를 입력하세요\n인증코드가 전송되지 않을 시 \("인증코드 재전송")을 해주세요")
                .padding(.top,1)
                .foregroundStyle(Color.gray)
                .font(.system(size: 14, weight: .regular))
            
            Spacer()
            Spacer()
            
            Button(action:{
                certNextStep()
            },label: {
                Text("본인인증")
                    .frame(maxWidth:.infinity)
                    .frame(height: 50).foregroundColor(.white)
                    .background(isCertOk ? Color.Orange_Color : Color.gray)
                    .cornerRadius(8)
            }).disabled(isCertOk ? false : true)
        }
        .padding(30)
        .customAlert(isPresented: $isShowingAlert){
            CustomAlertView(title: "",
                            content: "회원 정보가 없습니다.\n회원가입하시겠습니까?",
                            textAlignment: .center,
                            confimBtn: {CustomAlertButtonView(type: .CONFIRM , isPresented: $isShowingAlert) {
                                        self.isNavigate.toggle()
                                    }},
                            cancelBtn: {CustomAlertButtonView(type: .CANCEL , isPresented: $isShowingAlert) {
                                        
                                    }}
            )
        }
        .background(
            NavigationLink(
                destination: TermsView(),
                isActive: $isNavigate
            ) {
                EmptyView()
            }
        )
        .navigationBarBackButtonHidden(true)
        .customNavigationBar(
            centerView: {
                E4logoView()
            },
            leftView: {
                EmptyView()
            },
            rightView: {
                EmptyView()
            },
            useDivider: false
        )
        
    }
    
    // 인증코드 발송
    private func sendCertCheck(){
        print("휴대폰번호 : \(registerViewModel.userData.hpNo)")
        
        // 입력받은 휴대폰 번호로 인증번호 발송 로직 추가하기
        
    }
    
    private func checkCode(){
        print("입력한 코드 : \(certNumber)")
        print("결과  코드 : \(certResultNumber)")
        
        if certNumber == certResultNumber { // 코드 일치 확인
            isCertOk = true
            checkMessage = "확인 되었습니다"
        } else {
            isCertOk = false
            checkMessage = "다시 입력해 주세요"
        }
    }
    
    // 인증 코드 확인이 끝났고 기가입 여부를 체크해야 한다
    // 가입된 유저라면 MainView , 기가입 유저라면 회원가입 로직을 수행해야 한다.
    private func certNextStep(){
        // step1 - 가입 유저인지 체크하기
        
        // step2 - 가입 여부에 따른 view 이동 처리
        isShowingAlert = true
        
        
    }
    
}



struct CertView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            CertView()
//                .environmentObject(UserData())
        }
        
    }
}
