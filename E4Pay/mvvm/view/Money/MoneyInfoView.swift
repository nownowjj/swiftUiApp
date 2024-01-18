//
//  MoneyInfoView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/14/24.
//

import SwiftUI

struct MoneyInfoView: View {
    var body: some View {
        VStack{
            VStack{
                MyMoneyInfoItemView()
                MoneyInfoBottomView()
                    .padding()
            }
            .background(Color.gray)
            .cornerRadius(20)
        }
        .padding(30)
        .customNavigationBar(
            centerView: {
                Text("E4.PAY 머니")
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
    MoneyInfoView()
}

struct MyMoneyInfoItemView:View{
    var body: some View{
        VStack(alignment:.leading ){
            
            // 카드 상단 제목
            HStack {
                Text("MONEY")
            }
            .foregroundColor(Color.gray)
            .font(.system(size: 20, weight: .bold))
            
            Spacer()
            
            
            VStack{
                HStack{
                    HStack{
                        Text("신한 11047773****")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 14, weight: .bold))
                        Spacer()
                        Text("환불")
                            .padding(.vertical, 8)
                            .padding(.horizontal, 15)
                            .font(.system(size: 16, weight: .bold))
                            .background(Color.purple)
                            .cornerRadius(20)
                            .onTapGesture {
                                print("환불")
                            }
                    }
                }
                
                
                HStack{
                    
                    HStack{
                        Text("\("11,000")원")
                            .font(.system(size: 26, weight: .bold))
                        Spacer()
//                        NavigationLink()
                        Text("충전")
                            .padding(.vertical, 8)
                            .padding(.horizontal, 15)
                            .font(.system(size: 16, weight: .bold))
                            .background(Color.gray)
                            .cornerRadius(20)
                            .onTapGesture {
                                print("충전")
                            }
                    }
                }
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


struct MoneyInfoBottomView:View{
    
    var body: some View{
        NavigationLink(destination: MoneyPayListView()) {
            HStack{
                Text("머니 결제")
            }
        }
        .foregroundColor(Color.black)
        .padding(.vertical,15)
        .frame(maxWidth:.infinity)
        .background(Color.white)
        .cornerRadius(10)
        .frame(height:60)
        .cornerRadius(15)
    }
}
