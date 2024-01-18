//
//  ToolbarBackBtnView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/10/24.
//

import SwiftUI

struct ToolbarBackBtnView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Button {
            print("Custom Action")
            // 2
            dismiss()
        } label: {
            Image(systemName: "chevron.backward")
                .foregroundStyle(Color.black)
        }
    }
}



struct ToolbarBackBtnView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ToolbarBackBtnView()
        }
    }
}
