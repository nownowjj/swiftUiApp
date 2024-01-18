//
//  CardManagementView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/15/24.
//

import SwiftUI

struct CardManagementView: View {
    @State private var isPresented: Bool = false
    
    @State var isAlreadyReport:Bool = false
    
    @State private var alertConfiguration: AlertConfiguration = .cancleReport
    
    
    var body: some View {
        
        ScrollView{
            VStack{
                VStack{
                    CardItemView(type:true ,title: "CARD", imageName: "card-img", cardNumber: "0000-00**-****-0000" , cardName: "체리카드")
                    CardItemBottomView(isActiveCard: true)
                }
                .background(Color.InputBack)
                .padding(20)
                
                VStack(alignment:.leading){
                    VStack(alignment: .leading , spacing: 20){
                        Text("카드설정").font(.system(size: 20, weight: .bold))
                        VStack(spacing: 30){
                            
                            HStack{
                                Text("카드번호 보기")
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .foregroundStyle(Color.black)
                            }
                            
                            if isAlreadyReport{
                                HStack {
                                    Text("분실 신고")
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                        .foregroundStyle(Color.black)
                                }.onTapGesture {
                                    isPresented.toggle()
                                }
                            }
                            else{
                                HStack {
                                    Text("분실신고 해제")
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                        .foregroundStyle(Color.black)
                                }.onTapGesture {
                                    isPresented.toggle()
                                }
                            }
                        }
                        .font(.system(size: 16, weight: .regular))
                    }
                    .padding()
                    .background(Color.white)
                    
                    
                    VStack(alignment: .leading , spacing: 20){
                        Text("카드 관리").font(.system(size: 20, weight: .bold))
                        VStack(spacing: 30){
                            NavigationLink(destination: AddressView()) {
                                HStack{
                                    Text("카드 비밀번호 변경")
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                        .foregroundStyle(Color.black)
                                }
                            }
                            HStack{
                                Text("사용 등록")
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .foregroundStyle(Color.black)
                            }
                        }.font(.system(size: 16, weight: .regular))
                    }
                    .padding()
                    .background(Color.white)
                }
                .background(Color.InputBack)
            }
        }
        .customNavigationBar(
            centerView: {
                Text("카드 관리")
            },
            leftView: {
                ToolbarBackBtnView()
            },
            rightView: {
                EmptyView()
            }
        )
        .customAlert(isPresented: $isPresented){
            CustomAlertView(title: alertConfiguration.title,
                            content: alertConfiguration.content) {
                CustomAlertButtonView(type: .CONFIRM , isPresented: $isPresented) {
                    print("확인 성공")
                }
            } cancelBtn: {
                CustomAlertButtonView(type: .CANCEL , isPresented: $isPresented){
                    print("취소 성공")
                }
            }
        }
    }
}

#Preview {
    CardManagementView()
}


enum AlertConfiguration {
    case newReport
    case cancleReport

    var title: String {
        switch self {
        case .newReport:
            return "분실신고를 하시겠습니까?"
        case .cancleReport:
            return "분실신고를 해제 하시겠습니까?"
        }
    }

    var content: String {
        switch self {
        case .newReport:
            return "분실신고 즉시 해당 카드 사용이 정지됩니다.\n카드를 찾으시면 언제든지 앱에서 분실해제\n가능합니다.\n카드 재발급은 앱에서 신청하실 수 있습니다.\n\n고객센터문의(02-1234-1232"
        case .cancleReport:
            return "분실신고 해제 즉시 해당 카드를 사용하실 수\n있습니다.\n\n고객센터문의(02-1234-1232"
        }
    }
}
