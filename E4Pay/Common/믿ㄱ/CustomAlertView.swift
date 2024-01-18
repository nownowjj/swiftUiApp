//
//  CustomAlertButton.swift
//  E4Pay
//
//  Created by 20-N311 on 1/15/24.
//

import SwiftUI


public struct ClaerBackground: UIViewRepresentable{
    
    public func makeUIView(context: Context) ->  UIView {
        
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {}
}

public struct CustomAlertView: View {
    
    // 타이틀
    public var title: String = ""
    // 내용
    public var content: String = ""
    // 텍스트 정렬
    public let textAlignment: TextAlignment
    // 확인버튼
    public let confimBtn: CustomAlertButtonView
    // 취소버튼
    //    public let cancelBtn: CustomAlertButtonView
    public let cancelBtn: (() -> CustomAlertButtonView)?
    
    
    public init(title: String, content: String, textAlignment: TextAlignment = .leading , confimBtn: () -> CustomAlertButtonView, cancelBtn: (() -> CustomAlertButtonView)? = nil) {
        self.title = title
        self.content = content
        self.confimBtn = confimBtn()
        self.cancelBtn = cancelBtn
        self.textAlignment = textAlignment
    }
    
    
    public var body: some View {
        ZStack{
            //배경색 지정
            Color.black
                .opacity(0.5)
                .ignoresSafeArea()
            
            VStack{
                VStack{
                    // 타이틀
                    if "" != self.title{
                        Text(self.title)
                            .padding(.top,20)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.black)
                            .multilineTextAlignment(.center)
                    }
                    
                    // 내용
                    Text(self.content)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.black)
                        .padding(.vertical,30)
                        .multilineTextAlignment(textAlignment)
                }
                .frame(width:350)
                .overlay(Rectangle().frame(width:.infinity,height: 2).foregroundColor(Color.inputBack) , alignment: .bottom)
                
                // 버튼
                HStack{
                    if let cancelBtn = cancelBtn {
                        cancelBtn()
                        Rectangle()
                            .foregroundColor(Color.inputBack)
                            .frame(width: 2, height: .infinity)
                    }
                    
                    self.confimBtn
                }
                .frame(height:50)
            }
            .padding(.top,20)
            .frame(width:350)
            .background(Color.white)
            .cornerRadius(10)
        }
        .background(ClaerBackground())
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    @State private static var isPresented = true
    
    static var previews: some View {
        ScrollView{
            ZStack{
                //배경색 지정
                Color.black
                    .opacity(0.1)
                    .ignoresSafeArea()
                
                VStack(spacing:50){
                    
                    
                    CustomAlertView(title: "confirm , cancel ",
                                    content: "분실신고 즉시 해당 카드 사용이 정지됩니다.\n카드를 찾으시면 언제든지 앱에서 분실해제\n가능합니다.\n카드 재발급은 앱에서 신청하실 수 있습니다.",
                                    confimBtn: {CustomAlertButtonView(type: .CONFIRM , isPresented: $isPresented) {
                                                    print("확인 성공")
                                                    }
                                                },
                                    cancelBtn: {CustomAlertButtonView(type: .CANCEL , isPresented: $isPresented){
                                                    print("취소 성공")
                                                }
                                                })
                    
                    
                    Divider()
                    
                    CustomAlertView(title: "cancelBtn 없음",
                                    content: "분실신고 즉시 해당 카드 사용이 정지됩니다.\n카드를 찾으시면 언제든지 앱에서 분실해제\n가능합니다.\n카드 재발급은 앱에서 신청하실 수 있습니다.",
                                    confimBtn: {CustomAlertButtonView(type: .CONFIRM , isPresented: $isPresented) {
                        print("확인 성공")
                    }
                    })
                    
                    Divider()
                    
                    
                    CustomAlertView(title: "textAlignment 옵션 사용",
                                    content: "분실신고 즉시 해당 카드 사용이 정지됩니다.\n카드를 찾으시면 언제든지 앱에서 분실해제\n가능합니다.\n카드 재발급은 앱에서 신청하실 수 있습니다.",
                                    textAlignment: .center,
                                    confimBtn: {CustomAlertButtonView(type: .CONFIRM , isPresented: $isPresented) {
                                            print("확인 성공")
                                            }
                                        })
                    
                    
                    Divider()
                }
            }
        }
    }
}
