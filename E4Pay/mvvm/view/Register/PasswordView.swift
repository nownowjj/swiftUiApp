//
//  LockPasswordView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/7/24.
//

import SwiftUI

struct PasswordView: View {
    @StateObject var viewModel = PasswordViewModel()
    
    @StateObject private var registerViewModel = RegisterViewModel.shared
//    @EnvironmentObject var userData : UserData
    var body: some View {
        
        VStack{
            Spacer()
            
            HStack{
                Text(!viewModel.isFirstOk ? "비밀번호\n6자리를 입력해주세요":"비밀번호\n6자리를 재입력해주세요")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
            }.padding(.leading,30)
            
            // 비밀번호 일치하지 않을시
            if viewModel.isNotSame {
                HStack{
                    Text("비밀번호가 일치하지 않습니다")
                        .foregroundStyle(Color.red).padding(.top)
                    Spacer()
                }.padding(.leading,30)
            }
            
            Spacer()
            
            HStack (spacing: 10){
                ForEach(0...5 , id: \.self){index in
                    SecretPasswordView(index: index, viewModel: viewModel , type: .Password)
                }
            }
            
            if viewModel.isFirstOk {
                Button(action: viewModel.resetPassword , label: {
                    Text("비밀번호 다시 설정하기").underline().padding(.top,20).foregroundColor(Color.black)
                })
            }
            
            Spacer()

            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 15) {
                ForEach(viewModel.shuffledArray , id: \.self){value in
                    PasswordButton(value: "\(value)",viewModel: viewModel, type: .Password)
                }
                
                PasswordButton(value: "초기화", viewModel: viewModel , deleteAll: true, type: .Password)
                PasswordButton(value : "0" , viewModel: viewModel, type: .Password)
                PasswordButton(value : "delete" , viewModel: viewModel, type: .Password)
            }.background(Color.LockPassColor)


            NavigationLink(destination: RegisterSuccessView(), isActive: $registerViewModel.isSuccess) {
                EmptyView()
            }
            .hidden()
        }
        .onReceive(viewModel.$navigateToNextView) { newValue in
            registerViewModel.userData.monySertNo = viewModel.password
            
            print(registerViewModel.userData)
            if newValue {
//                userData.custom() // navigateToNextView가 true일 때 원하는 동작 수행
                registerViewModel.action(state: .REGISTER, param: "")
            }
        }
        .background(Color.white)
        .customNavigationBar(
            centerView: {
                Text("머니 비밀번호 등록")
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

struct PasswordView_Preview : PreviewProvider{
    static var previews: some View{
        NavigationView{
            PasswordView()
//                .environmentObject(UserData())
        }
    }
}

enum PasswordViewType{
    case Identification
    case Password
    case CardPassword
}

struct SecretPasswordView : View{
    var index : Int
    @ObservedObject var viewModel: PasswordViewModel
    var type : PasswordViewType
    
    var body: some View{
        
        ZStack{
            Circle()
                .fill(Color.PasswordBack)
                .frame(width: circleSize , height: circleSize)
            
            
            if viewModel.password.count > index{
                Circle()
                    .fill(Color.black)
                    .frame(width: circleSize , height: circleSize)
            }
            
            if viewModel.identification.count > index{
                Circle()
                    .fill(Color.black)
                    .frame(width: circleSize , height: circleSize)
            }
            
            if viewModel.cardPassword.count > index{
                Circle()
                    .fill(Color.black)
                    .frame(width: circleSize , height: circleSize)
            }
            
        }
    }
    
    var circleSize: CGFloat {
        switch type {
        case .Identification:
            return 20
        case .Password:
            return 30
        case .CardPassword:
            return 30
        }
    }
    
}

struct PasswordButton : View{
    var value  : String
    @ObservedObject var viewModel: PasswordViewModel
    var deleteAll = false
    var type : PasswordViewType
    
    var body: some View{
        Button(action:{
            switch type {
            case .Identification:
                viewModel.setIdentification(value, deleteAll)
            case .Password:
                viewModel.setPassword(value, deleteAll)
            case .CardPassword:
                viewModel.setCardPassword(value, deleteAll)
            }
        }, label: {
            VStack{
                if value.count  > 1 {
                    // Image ..
                    Text(value)
                        .font(.system(size:24))
                        .foregroundColor(.white)
                }else{
                    Text(value)
                        .font(.title)
                        .foregroundColor(.white)
                }
                
            }
            .padding()
            
        })
    }
}
