//
//  E4logoView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/11/24.
//

import SwiftUI

struct E4logoView: View {
    var body: some View {
        Image("e4pay-logo")
            .resizable()
            .frame(width: 80, height: 20, alignment: .center)
    }
}

#Preview {
    E4logoView()
}
