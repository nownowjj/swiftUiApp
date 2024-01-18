//
//  CustomNavigationBar.swift
//  E4Pay
//
//  Created by 20-N311 on 1/11/24.
//

import SwiftUI

struct CustomNavigationBar<C,L,R>: ViewModifier where C : View , L : View , R : View{
    let centerView: (() -> C)?
    let leftView: (() -> L)?
    let rightView: (() -> R)?
    let useDivider: Bool
    
    init(centerView: (() -> C)? = nil, leftView: (() -> L)? = nil, rightView: (() -> R)? = nil, useDivider: Bool = true) {
            self.centerView = centerView
            self.leftView = leftView
            self.rightView = rightView
            self.useDivider = useDivider
        }
    
    func body(content: Content) -> some View {
        VStack{
            ZStack{
                HStack{
                    self.leftView?()
                    
                    Spacer()
                    
                    self.rightView?()
                }
                .frame(height:44.0)
                .frame(maxWidth:.infinity)
                .padding(.horizontal, 16.0)
//                .overlay(Rectangle().frame(height: 1).foregroundColor(.gray), alignment: .bottom)
                .overlay(useDivider ? Rectangle().frame(height: 1).foregroundColor(Color.inputBack) : nil, alignment: .bottom)
                
                HStack{
                    Spacer()
                    
                    self.centerView?()
                    
                    Spacer()
                }
            }
            
            content
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .customNavigationBar(
                centerView: {
                    Text("Custom Title")
                        .foregroundColor(.black)
                        .font(.headline)
                },
                leftView: {
//                    EmptyView()
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.black)
                },
                rightView: {
                    Image(systemName: "gear")
                        .foregroundColor(.black)
                },
                useDivider : true
            )
    }
}
