//
//  CardRegisterView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/15/24.
//

import SwiftUI

struct CardInfoRegisterView: View {
    //    @State var nextPossible:Bool = false
    
    @State var cardNumber:String = ""
    @State var cardExpiredDate:String = ""
    @State var cardCvc:String = ""
    
    
    var nextPossible: Bool {
        return cardNumber.count == 16 && cardExpiredDate.count == 4 && cardCvc.count == 3
    }
    
    var body: some View {
        VStack(alignment:.leading , spacing:10){
            
            Text("카드 정보를 입력해주세요")
                .font(.system(size: 24, weight: .bold))
            
            Text("카드에 기재된 정보를 입력해주세요")
                .foregroundStyle(Color.black)
                .padding(.bottom,10)
            
            HStack{
                CommonTextFiledView(placeholder: "카드번호", text: $cardNumber, keyboardType: .numberPad ,
                                    onChange: {newValue in
                                                if newValue.count > 16 {
                                                    cardNumber = String(newValue.prefix(16))
                                               }})
                
                
                Spacer()
                
                Image(systemName: "xmark.circle")
                    .onTapGesture {
                        cardNumber = ""
                    }
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
            

            
            CommonTextFiledView(placeholder: "유효기간 4자리(MM/YY)", text: $cardExpiredDate, keyboardType: .numberPad ,
                                onChange: {newValue in
                                            if newValue.count > 4 {
                                                cardExpiredDate = String(newValue.prefix(4))
                                           }})
            
            SecureField("CVC 번호 (카드 뒷면 3자리)", text: $cardCvc)
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
            
            NavigationLink(destination: CardRegisterPasswordView()) {
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
                Text("카드 정보 입력")
            },
            leftView: {
                ToolbarBackBtnView()
            },
            rightView: {
                EmptyView()
            }
        )

    }
}



#Preview {
    CardInfoRegisterView()
}
