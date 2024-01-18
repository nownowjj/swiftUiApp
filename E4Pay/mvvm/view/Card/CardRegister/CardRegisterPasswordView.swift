//
//  CardRegisterPasswordView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/15/24.
//

import SwiftUI

struct CardRegisterPasswordView: View {
    @StateObject var viewModel = PasswordViewModel()
    @State var nextPossible = true
//    @State private var isPresented: Bool = false
    @State var isNextStep:Bool = false
    
    
    var body: some View {
        VStack{
            Spacer()
            
            HStack{
                Text("카드 비밀번호\n4자리를 입력해주세요")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
            }.padding(.leading,30)
            
            // 비밀번호 일치하지 않을시
            if viewModel.isNotSame {
                HStack{
                    Text("잘못된 비밀번호 입니다. 다시 확인해주세요")
                        .foregroundStyle(Color.red)
                    Spacer()
                }.padding(.leading,30)
            }
            
            Spacer()
            
            HStack (spacing: 10){
                ForEach(0...3 , id: \.self){index in
                    SecretPasswordView(index: index, viewModel: viewModel , type: .CardPassword)
                }
            }
            
            
            Spacer()

            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 15) {
                ForEach(viewModel.shuffledArray , id: \.self){value in
                    PasswordButton(value: "\(value)",viewModel: viewModel, type: .CardPassword)
                }
                
                PasswordButton(value: "초기화", viewModel: viewModel , deleteAll: true, type: .CardPassword)
                PasswordButton(value : "0" , viewModel: viewModel, type: .CardPassword)
                PasswordButton(value : "delete" , viewModel: viewModel, type: .CardPassword)
            }.background(Color.LockPassColor)
            
            
            
            NavigationLink(destination: RegisterSuccessView(), isActive: $viewModel.navigateToNextView) {
                EmptyView()
            }.hidden()
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .customNavigationBar(
            centerView: {
                Text("카드 비밀번호 입력")
            },
            leftView: {
                ToolbarBackBtnView()
            },
            rightView: {
                EmptyView()
            }
        )
        .customAlert(isPresented: $viewModel.successRegister){
            CustomAlertView(title: "",
                            content: "카드 사용등록이 완료되었습니다.") {
                CustomAlertButtonView(type: .CONFIRM , isPresented: $viewModel.successRegister) {
                    isNextStep = true
                }
            }
        }
        .background(
            NavigationLink(
                destination: HomeView(),
                isActive: $isNextStep
            ) {
                EmptyView()
            }
        )
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

#Preview {
    CardRegisterPasswordView()
}
