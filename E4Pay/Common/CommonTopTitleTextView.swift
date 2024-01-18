//
//  CommonTopTitleTextView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/11/24.
//

import SwiftUI

struct CommonTopTitleTextView: View {
    var title:String
    
    var body: some View {
        Text(title)
            .font(.system(size: 24, weight: .bold))
    }
}

#Preview {
    CommonTopTitleTextView(title: "예시 타이틀")
}
