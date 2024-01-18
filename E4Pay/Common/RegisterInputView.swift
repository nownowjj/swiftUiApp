//
//  RegisterInputView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/9/24.
//

import SwiftUI

struct RegisterInputView: View {
    var title:String
    var numberTitle:String
    var accountTitle:String
    var accountNumber:String
    
    var body: some View {
        VStack(spacing:20){
            HStack{
                Text("\(title)           \(accountTitle)")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            HStack{
                Text("\(numberTitle)     \(accountNumber)")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(maxWidth:.infinity)
        .frame(height: 120)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
        .background(Color.InputBack)
        .cornerRadius(8)
    }
}

#Preview {
    RegisterInputView(title:"제목",numberTitle:"제목2",accountTitle: "카카오뱅크", accountNumber: "111131231")
}
