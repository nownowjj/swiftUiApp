//
//  SideMenuView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/11/24.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isMenuVisible: Bool
    @Environment(\.presentationMode) var presentationMode
    @State private var showingSheet = false
    var body: some View {
        
        
        ZStack(alignment:.leading) {
            ScrollView{
                VStack(alignment:.leading){
                    VStack(alignment: .leading , spacing: 20){
                        Text("머니").font(.system(size: 20, weight: .bold))
                        VStack(spacing: 30){
                            NavigationLink(destination: MoneyChargeView()) {
                                HStack{
                                    Text("연결계좌 변경")
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                        .foregroundStyle(Color.black)
                                }
                            }
                            NavigationLink(destination: MoneyChargeView()) {
                                HStack {
                                    Text("충전")
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                        .foregroundStyle(Color.black)
                                }
                            }
                            NavigationLink(destination: RefundView()) {
                                HStack {
                                    Text("환불")
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                        .foregroundStyle(Color.black)
                                }
                            }
                            NavigationLink(destination: MoneyHistoryView()) {
                                HStack {
                                    Text("머니 이용내역")
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                        .foregroundStyle(Color.black)
                                }
                            }
                            
                            HStack{
                                Text("머니 비밀번호 변경")
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .foregroundStyle(Color.black)
                            }
                            NavigationLink(destination: MoneyPayListView()) {
                                HStack{
                                    Text("머니 결제")
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                        .foregroundStyle(Color.black)
                                }
                            }
                            NavigationLink(destination: MoneyInfoView()) {
                                HStack{
                                    Text("내 머니정보")
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                        .foregroundStyle(Color.black)
                                }
                            }
                            
                        }.font(.system(size: 16, weight: .regular))
                    }.padding().background(Color.white)
                    
                    
                    VStack(alignment: .leading , spacing: 20){
                        Text("카드").font(.system(size: 20, weight: .bold))
                        VStack(spacing: 30){
                            NavigationLink(destination: CardInfoRegisterView()) {
                                HStack{
                                    Text("카드 사용등록")
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                        .foregroundStyle(Color.black)
                                }
                            }
                            HStack{
                                Text("카드 결재")
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .foregroundStyle(Color.black)
                            }.onTapGesture {showingSheet.toggle()}
                            HStack{
                                Text("카드 분실신고/해제")
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .foregroundStyle(Color.black)
                            }
                            NavigationLink(destination: ChangeCardPasswordView()) {
                                HStack{
                                    Text("카드 비밀번호 변경")
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                        .foregroundStyle(Color.black)
                                }
                            }
                            NavigationLink(destination: AddressView()) {
                                HStack{
                                    Text("카드 신청")
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                        .foregroundStyle(Color.black)
                                }
                            }
                            NavigationLink(destination: CardManagementView()) {
                                HStack{
                                    Text("내 카드 보기")
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                        .foregroundStyle(Color.black)
                                }
                            }
                        }.font(.system(size: 16, weight: .regular))
                    }.padding().background(Color.white)
                }
                
            }
            .background(Color.InputBack)
        }
        .customNavigationBar(
            centerView: {
                Text("메뉴")
            },
            leftView: {
                ToolbarBackBtnView()
            },
            rightView: {
                EmptyView()
            }
        )
        .sheet(isPresented: $showingSheet) {
            CardPayQrView()
        }
    }
}


struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SideMenuView(isMenuVisible: .constant(true))
        }
    }
}
