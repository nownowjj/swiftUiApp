//
//  IdentificationNumberView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/15/24.
//

import SwiftUI

struct IdentificationNumberView: View {
    @StateObject var viewModel = PasswordViewModel()
    @State var nextPossible = true
    
    var body: some View {
        VStack{
            
            VStack(alignment:.center){
                CommonTopTitleTextView(title: "카드 발급을 위해\n주민등록번호를 입력해주세요")
                    .padding(.trailing,30)
                
                Spacer()
                
                HStack (spacing: 2){
                    ForEach(0...12 , id: \.self){index in
                        SecretPasswordView(index: index, viewModel: viewModel , type: .Identification)
                        if index == 5 {
                            Text("-")
                                .font(.system(size: 24, weight: .regular))
                                .foregroundColor(.black)
                                .frame(width: 20, height: 20)
                        }
                    }
                }
                .padding()
                
                Spacer()
            
                NavigationLink(destination: CardApplyPasswordView()) {
                    Button(action:{},label: {
                        Text("확인")
                            .frame(maxWidth:.infinity)
                            .frame(height: 40).foregroundColor(.white)
                            .background(viewModel.navigateToNextView ? Color.LockPassColor : Color.gray)
                            .cornerRadius(8)
                    }).disabled(viewModel.navigateToNextView)
                }
                
            }
            .padding(30)
            
            Spacer()
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 15) {
                ForEach(viewModel.shuffledArray , id: \.self){value in
                    PasswordButton(value: "\(value)",viewModel: viewModel, type: .Identification)
                }
                
                PasswordButton(value: "초기화", viewModel: viewModel , deleteAll: true, type: .Identification)
                PasswordButton(value : "0" , viewModel: viewModel, type: .Identification)
                PasswordButton(value : "delete" , viewModel: viewModel, type: .Identification)
            }.background(Color.LockPassColor)
            
        }
        .customNavigationBar(
            centerView: {
                Text("본인인증")
            },
            leftView: {
                ToolbarBackBtnView()
            },
            rightView: {
                EmptyView()
            }
        )
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

#Preview {
    IdentificationNumberView()
}

