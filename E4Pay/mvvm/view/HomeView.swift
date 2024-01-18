//
//  MainView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/8/24.
//

import SwiftUI


struct HomeView: View {
    @State private var isMenuVisible = false
    @State var isPresented:Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                
                CardItemView(type:false ,title: "E4.PAY")
                
//                CardItemView(type:true ,title: "CARD", imageName: nil, cardNumber: nil)
//                CardItemBottomView(isActiveCard: false)
                
                CardItemView(type:true ,title: "CARD", imageName: "card-img", cardNumber: "0000-00**-****-0000" , cardName: "체리카드")
                CardItemBottomView(isActiveCard: true)
                    .background(NavigationLink("", destination: CardInfoRegisterView(), isActive: $isPresented))
                
                
                FranchiseeView()
                
                
                
            }
            .padding(30)
        }
        .navigationBarBackButtonHidden(true)

        .customNavigationBar(
            centerView: {
                E4logoView()
            },
            leftView: {
                EmptyView()
            },
            rightView: {
                NavigationLink(destination: SideMenuView(isMenuVisible: $isMenuVisible)) {
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(Color.black)
                }
            }
        )
        .fullScreenCover(isPresented: $isMenuVisible, content: {
            // 여기에 메뉴View를 추가하세요
            SideMenuView(isMenuVisible: $isMenuVisible)
        })
        .sheet(isPresented: $isPresented) {
           CardPayQrView()
        }
    }
    
    func menuClick(){
        isMenuVisible.toggle()
    }
}


struct CardItemView:View{
    var type:Bool
    var title: String
    var imageName: String?
    var cardNumber: String?
    var cardName: String?
    
    var body : some View{
        VStack(alignment:.leading ){
            
            // 카드 상단 제목
            HStack {
                Text(title)
                if let subtitle = cardName {
                    Text("(\(subtitle))")
                }
            }
            .foregroundColor(Color.gray)
            .font(.system(size: 20, weight: .bold))
            
            Spacer()
            
            
            VStack{
                // 하단 잔액 및 카드 정보  type true: card view , false: money view
                HStack{
                    // card view
                    if type{
                        
                        // 카드 이미지 유무에 따른 문구 및 카드 이미지
                        if let imageName = imageName{
                            Image(imageName)
                                .resizable()
                                .frame(width:100 , height:60)
                        }else{
                            Text("보유하신 카드가 없습니다.\n카드 신청하러 가기")
                                .font(.system(size: 14, weight: .bold))
                        }
                        Spacer()
                        // 카드 번호 유무에 따른 카드신청 및 카드정보
                        if let cardNumber = cardNumber{
                            VStack(alignment:.leading){
                                Text(cardNumber)
                                Text("E4NET")
                                Text("2023/01")
                            }
                            .font(.system(size: 12, weight: .bold))
                        }else{
                            Text("카드신청")
                                .padding(.vertical, 8)
                                .padding(.horizontal, 15)
                                .font(.system(size: 16, weight: .bold))
                                .background(Color.Orange_Color)
                                .cornerRadius(20)
                        }
                        
                    }
                    // money view
                    else{
                        HStack{
                            Text("11,000원")
                                .font(.system(size: 26, weight: .bold))
                            Spacer()
                            Text("충전")
                                .padding(.vertical, 8)
                                .padding(.horizontal, 15)
                                .font(.system(size: 16, weight: .bold))
                                .background(Color.gray)
                                .cornerRadius(20)
                        }
                    }
                }
                .padding(.bottom,20)
            }
            
            Spacer()
        }
        .padding(.top,20)
        .padding(.horizontal,30)
        .frame(maxWidth:.infinity)
        .frame(height: 160)
        .foregroundColor(Color.white)
        .border(Color.black)
        .background(Color.LockPassColor)
        .cornerRadius(15)
    }
}

struct CardItemBottomView:View{
    var isActiveCard:Bool
    
    var body: some View{
        HStack{
            HStack{
                Text(isActiveCard ? "QR 결제 " : "카드 등록")
                if !isActiveCard {
                    Image(systemName: "plus")
                }else{
                    Image("ico_qr")
                }
            }
            .padding(.vertical,7)
            .frame(maxWidth:.infinity)
            .background(Color.white)
            .cornerRadius(10)
            .onTapGesture {
//                isPresented.toggle()
            }
        }
        .padding(10)
        .frame(maxWidth:.infinity)
        .frame(height:60)
        .background(Color.inputBack)
        .cornerRadius(15)
    }
}

struct FranchiseeView:View{
    
    
    var body:some View{
        VStack(alignment:.leading){
            Text("가맹점 바로가기").font(.system(size: 24, weight: .medium))
            
            FranchiseeItemView()
        }
//        .padding(.top,30)
    }
}

struct FranchiseeItemView:View{
    
    var body:some View{
        VStack{
            HStack{
                VStack{
                    Text("이포넷 베이커리")
                    Text("상시 10% 할인")
                }
                Spacer()
                Image("ico-brand1")
                    .resizable()
                    .frame(width: 50,height: 50)
            }
            
            Divider()
            HStack{
                VStack{
                    Text("이포넷 베이커리")
                    Text("상시 10% 할인")
                }
                Spacer()
                Image("ico-brand2")
                    .resizable()
                    .frame(width: 50,height: 50)
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.inputBack, lineWidth: 1)
        )
    }
}
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            
            NavigationView {
                HomeView()
            }
            
        }
    }
