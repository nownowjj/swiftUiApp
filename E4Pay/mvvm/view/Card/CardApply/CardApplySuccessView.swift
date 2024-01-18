//
//  CardApplySuccessView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/15/24.
//

import SwiftUI

struct CardApplySuccessView: View {
    var body: some View {
        VStack(spacing:20){
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 80,height: 80)
                .foregroundColor(Color.green)

            Text("카드신청이\n정상적으로 완료되었습니다")
                .multilineTextAlignment(.center)
                .font(.system(size: 24, weight: .bold))
            
            VStack(spacing:20){
                HStack{
                    Text("이름").frame(width:60)
                    Text("홍길동")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                HStack{
                    Text("배송지").frame(width:60)
                    Text("서울시 강남구 테헤란로 87길 동성빌딩(15층)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .frame(maxWidth:.infinity)
            .frame(height: 120)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
            .background(Color.InputBack)
            .cornerRadius(8)
            
            Spacer()
            
            NavigationLink(destination: HomeView()) {
                Text("카드정보 확인")
                    .frame(maxWidth:.infinity)
                    .frame(height: 50).foregroundColor(.white)
                    .background(Color.LockPassColor)
                    .cornerRadius(8)
            }
        }
        .padding(30)
        .customNavigationBar(
            centerView: {
                Text("카드신청 완료")
            },
            leftView: {
                EmptyView()
            },
            rightView: {
                EmptyView()
            }
        )
    }
}

#Preview {
    CardApplySuccessView()
}
