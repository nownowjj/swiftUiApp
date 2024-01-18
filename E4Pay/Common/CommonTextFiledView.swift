//
//  CommonTextFiledView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/11/24.
//

import SwiftUI

struct CommonTextFiledView: View {
    var placeholder:String
    @Binding var text:String
    var keyboardType: UIKeyboardType = .default
    var onChange: ((String) -> Void)? = nil
    
    var body: some View {
        TextField(placeholder,text : $text)
            .frame(maxWidth:.infinity)
            .frame(height: 60)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            .background(Color.InputBack)
            .cornerRadius(8)
            .keyboardType(keyboardType)
            .onChange(of: text, perform: { newValue in
                onChange?(newValue)
            })
    }
}

#Preview {
    CommonTextFiledView(placeholder: "placeholder", text: .constant("Sample Text") )
}
