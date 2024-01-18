//
//  TermsView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/5/24.
//

import SwiftUI

class TermsViewModel: ObservableObject {
    @Published var allChecked: Bool = false
    @Published var isTermsChecked = [false, false, false, false]
    
    
    // 일괄 체크 on/off
    func toggleAllCheck() {
        allChecked.toggle()
        if allChecked {
            isTermsChecked = Array(repeating: true, count: isTermsChecked.count)
        } else {
            isTermsChecked = Array(repeating: false, count: isTermsChecked.count)
        }
    }
    
    // 개별 동의 체크 , 체크시에 전부 체크 되었는지 체크allChecked
    func toggleTerm(index: Int) {
        isTermsChecked[index].toggle()
        allChecked = isTermsChecked.allSatisfy { $0 }
    }
}

struct TermsView: View {
    @StateObject var viewModel = TermsViewModel()

    var body: some View {
        
        HStack{
            VStack(alignment:.leading , spacing: 10){
                Text("이용약관 동의")
                    .font(.system(size: 30, weight: .bold))
                
                Text("회원 가입을 위해 약관에 동의해주세요")
                    .font(.system(size: 16, weight: .regular))
                
                Spacer()
                
                HStack(spacing:10){
                    Image(viewModel.allChecked ? "all-check-on" : "all-check-off")
                    Text("모두 동의합니다")
                        .font(.system(size: 24, weight: .medium))
                }
                .padding(.bottom,30)
                .font(.system(size: 24, weight: .medium))
                .onTapGesture {
                    viewModel.toggleAllCheck()
                }
                
                ForEach(viewModel.isTermsChecked.indices, id: \.self) { index in
                    TermsAgreementView(
                        title: "[필수] 개인정보이용약관\(index + 1) 동의",
                        isChecked: $viewModel.isTermsChecked[index]
                    ) {
                        viewModel.toggleTerm(index: index)
                    }
                }
                
                Spacer()
                Spacer()
                Spacer()
                
                HStack(alignment: .center) {
                    NavigationLink(destination: AccountEnterView()) {
                        Button(action: {}) {
                            Text("동의하고 가입하기")
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .foregroundColor(.white)
                                .background(viewModel.allChecked ? Color.Orange_Color : Color.gray)
                        }.disabled(viewModel.allChecked)
                    }
                }.cornerRadius(8)
                
            }
            .padding(30)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .customNavigationBar(
            centerView: {
                Text("약관 동의")
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
    NavigationView {
        TermsView()
    }
}

struct TermsAgreementView: View {
    var title: String
    @Binding var isChecked: Bool
    var toggleAction: () -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            Button(action: toggleAction) {
                Image(isChecked ? "check-on" : "check-off")
            }
            Text(title)
                .font(.system(size: 20, weight: .thin))
        }
    }
}

