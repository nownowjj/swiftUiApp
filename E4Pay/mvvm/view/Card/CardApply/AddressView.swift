//
//  AddressView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/14/24.
//

import SwiftUI

struct AddressView: View {
    @State private var detailAddress:String = ""
    
    @StateObject var vm = DaumWebViewModel()

    var isRecivedAddress: Bool{
        return vm.address.roadAddress.count > 0
    }
    
    var nextPossible: Bool {
        return isRecivedAddress && detailAddress.count > 0
    }
    
    var body: some View {
        VStack(alignment:.leading, spacing:20 ){
            CommonTopTitleTextView(title: "카드를 배송받을 주소를\n입력하세요")
            
            HStack {
                Text(isRecivedAddress ? vm.address.roadAddress : "검색하기")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundStyle(isRecivedAddress ? Color.black : Color.gray)
                Spacer()
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.black)
                    .font(.system(size: 16, weight: .regular))
            }
            .frame(maxWidth:.infinity)
            .frame(height: 60)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            .background(Color.InputBack)
            .cornerRadius(8)
            .onTapGesture {
                vm.isShowingWebView.toggle()
            }
            
            
            CommonTextFiledView(placeholder: "상세주소 입력", text: $detailAddress)
            
            Spacer()
            
            NavigationLink(destination: IdentificationNumberView()) {
                Button(action:{},label: {
                    Text("다음")
                        .frame(maxWidth:.infinity)
                        .frame(height: 50).foregroundColor(.white)
                        .background(nextPossible ? Color.LockPassColor : Color.gray)
                        .cornerRadius(8)
                }).disabled(nextPossible)
            }
        }
        .sheet(isPresented: $vm.isShowingWebView, content: {
            WebView(request: URLRequest(url: URL(string: "https://nownowjj.github.io/daumApi/")!), daumWebViewModel: vm)
        })

        .padding(30)
        .customNavigationBar(
            centerView: {
                Text("배송정보 입력")
            },
            leftView: {
                ToolbarBackBtnView()
            },
            rightView: {
                EmptyView()
            }
        )
    }
}

#Preview {
    AddressView()
}
