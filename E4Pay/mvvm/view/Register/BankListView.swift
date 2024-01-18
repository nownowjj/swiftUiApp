//
//  BankListView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/17/24.
//

import SwiftUI

struct BankListView: View {
//    @StateObject var viewModel = BankViewModel()
    
    @Binding var isPresented: Bool
    @Binding var bankList: [BankList]
    var didSelectBank: (BankList) -> Void // 클로저를 통해 선택한 BankList를 전달
    
    var body: some View {
        VStack {
            ScrollView{
                Text("등록하실 계좌의 은행을 선택해주세요").font(.system(size: 22, weight: .regular))
                
                // Display banks in a grid
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 10) {
                    ForEach(bankList , id: \.instID) { bankInfo in
                        BankCell(bankInfo: bankInfo)
                            .frame(width:100,height: 100)
                            .background(Color.InputBack)
                            .cornerRadius(10)
                            .onTapGesture {
                                didSelectBank(bankInfo)
                                isPresented = false // SecondView 종료
                            }
                    }
                }.background(Color.white)
            }
        }
//        .onAppear {
//            viewModel.action(state: .getBank, param: "")
//        }
        .padding(20)
    }
}

//struct BankListView_Previews: PreviewProvider {
//    @State static var isPresented = false
//    @State static var selectedBank: BankList?
//
//    static var previews: some View {
//        BankListView(isPresented: $isPresented, bankList: Binding<[BankList]>) { bank in
//            selectedBank = bank
//        }
//    }
//}

struct BankCell: View {
    var bankInfo: BankList
    
    var body: some View {
        VStack{
            
            // 은행 이미지
//            Image(bankInfo.bankImage)
//                .resizable()
//                .frame(width: 50, height: 50)
            
            // 은행 이름
            Text(bankInfo.instNm)
        }
        
    }
}
