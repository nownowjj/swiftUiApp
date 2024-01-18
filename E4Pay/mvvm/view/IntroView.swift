//
//  IntroView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/17/24.
//

import SwiftUI

struct IntroView: View {
    @EnvironmentObject var userData:UserData
    
    var body: some View {
        NavigationView {
            
            VStack {
                Spacer()
                Image("intro-img")
                    .resizable()
                    .aspectRatio(CGSize(width: 1, height: 1.1), contentMode: .fit)
                
                Spacer()
                
                Text("쉽고 빠른 안전한 결제!\nE4.PAY로 경험해보세요!")
                    .foregroundStyle(Color.black)
                
                Spacer()
                
                NavigationLink(destination: HomeView()) {
                    Text("메인")
                }

                
                NavigationLink(destination: CertView()) {
                    Text("시작하기")
                }
 
                .foregroundColor(.white)
                .border(Color.black)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.black)
                .cornerRadius(10)
                
            }
            .padding(30)
        }
    }
}

#Preview {
    IntroView()
}
