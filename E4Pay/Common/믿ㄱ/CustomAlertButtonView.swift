//
//  CustomAlert.swift
//  E4Pay
//
//  Created by 20-N311 on 1/15/24.
//

import SwiftUI

public enum CustomAlertButtonType{
    case CONFIRM
    case CANCEL
}

public struct CustomAlertButtonView: View {
    public typealias Action = () -> ()
    
    @Binding public var isPresented: Bool
    
    // 텍스트
    public var btnTitle: String = "확인"
    // 배경색
    public var btnColor: Color = .blue
    // 전달받은 액션
    public var action: Action
    // Alert 타입
    public var type : CustomAlertButtonType
    
    public init(type : CustomAlertButtonType,
                isPresented: Binding<Bool>,
                action: @escaping Action){
        self._isPresented = isPresented
        
        switch type{
        case .CONFIRM:
            self.btnTitle = "예"
            self.btnColor = .red
        case .CANCEL:
            self.btnTitle = "아니오"
            self.btnColor = .black
        }
        self.action = action
        self.type = type
    }
    
    public var body: some View{
        Button{
            // 알럿 닫기
            self.isPresented = false
            // 액션
        action()
        }label: {
            Text(btnTitle)
                .foregroundStyle(self.btnColor)
                .frame(maxWidth:.infinity,maxHeight: .infinity)
        }
    }
    
}


