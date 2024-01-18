//
//  ViewExtension.swift
//  E4Pay
//
//  Created by 20-N311 on 1/11/24.
//

import Foundation
import SwiftUI
import UIKit
import OSLog

extension View {
    func customNavigationBar<C, L, R>(
        centerView: (() -> C)? = nil,
        leftView: (() -> L)? = nil,
        rightView: (() -> R)? = nil,
        useDivider: Bool = true
    ) -> some View where C: View, L: View, R: View {
        modifier(CustomNavigationBar(centerView: centerView, leftView: leftView, rightView: rightView ,  useDivider: useDivider))
    }
    
//    func hideKeyboard() {
//            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//    }
    
    // custom alert
    public func customAlert(isPresented:Binding<Bool> , customAlert: @escaping () -> CustomAlertView) -> some View{
        return modifier(CustomAlertModifier(isPresent: isPresented, alert: customAlert()))
    }
    
}

extension Int {
    func formatterStyle(_ numberStyle: NumberFormatter.Style) -> String? {
        let numberFommater: NumberFormatter = NumberFormatter()
        numberFommater.numberStyle = numberStyle
        return numberFommater.string(for: self)
    }
}


// MARK keyboard
extension UIApplication {
    func addTapGestureRecognizer() {
        guard let window = windows.first else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        window.addGestureRecognizer(tapGesture)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true // set to `false` if you don't want to detect tap during other gestures
    }
}



