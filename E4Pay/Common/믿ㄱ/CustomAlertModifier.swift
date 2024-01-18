//
//  CustomAlertModifier.swift
//  E4Pay
//
//  Created by 20-N311 on 1/15/24.
//

import SwiftUI

public struct CustomAlertModifier: ViewModifier {
    
    @Binding var isPresent: Bool
    
    let alert: CustomAlertView
    
    public func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: $isPresent) {
                alert
            }
            .transaction { transaction in
                transaction.disablesAnimations = true
            }
    }
}
