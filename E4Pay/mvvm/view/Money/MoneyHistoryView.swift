//
//  MoneyHistoryView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/12/24.
//

import SwiftUI

struct MoneyHistoryView: View {
    @State private var selectedYear: String
    @State private var selectedMonth: String

    var years: [String]
    var months: [String]
    
    var shuffledArray = ["전체", "결제","충전","송금","환불"]
    var transactionHistory: [TransactionItem]
    
    init() {
        // Set the initial selection based on the current date
        let currentDate = Date()
        let currentYear = Calendar.current.component(.year, from: currentDate)
        let currentMonth = Calendar.current.component(.month, from: currentDate)

        _selectedYear = State(initialValue: "\(currentYear)")
        _selectedMonth = State(initialValue: String(format: "%02d", currentMonth))

        // Set the available years and months
        years = (currentYear - 3...currentYear).map { String($0) }
        months = (1...12).map { String(format: "%02d", $0) }
        transactionHistory = [
            TransactionItem(date: "24.01.03", title: "아메리카노", dt: "22:00", amt: 22000, type: "결제"),
            TransactionItem(date: "24.01.03", title: "아메리카노", dt: "22:00", amt: 22000, type: "결제"),
            TransactionItem(date: "24.01.02", title: "아메리카노", dt: "22:00", amt: 22000, type: "결제"),
            TransactionItem(date: "24.01.02", title: "머니충전", dt: "22:00", amt: 22000, type: "충전"),
            TransactionItem(date: "24.01.02", title: "머니충전", dt: "22:00", amt: 22000, type: "충전"),
            TransactionItem(date: "24.01.02", title: "머니충전", dt: "22:00", amt: 22000, type: "충전"),
            TransactionItem(date: "24.01.02", title: "머니충전", dt: "22:00", amt: 22000, type: "충전"),
            TransactionItem(date: "24.01.02", title: "머니충전", dt: "22:00", amt: 22000, type: "충전"),
            TransactionItem(date: "24.01.02", title: "머니충전", dt: "22:00", amt: 22000, type: "충전"),
            TransactionItem(date: "24.01.02", title: "머니충전", dt: "22:00", amt: 22000, type: "충전"),
            TransactionItem(date: "24.01.02", title: "머니충전", dt: "22:00", amt: 22000, type: "충전"),
            TransactionItem(date: "24.01.02", title: "머니충전", dt: "22:00", amt: 22000, type: "충전"),
            TransactionItem(date: "24.01.02", title: "머니충전", dt: "22:00", amt: 22000, type: "충전"),
            TransactionItem(date: "24.01.02", title: "머니충전", dt: "22:00", amt: 22000, type: "충전"),
            TransactionItem(date: "24.01.02", title: "머니충전", dt: "22:00", amt: 22000, type: "충전"),
            TransactionItem(date: "24.01.01", title: "카카오뱅크", dt: "22:00", amt: -22000, type: "송금")
          ]
    }
    
    private var groupedTransactions: [String: [TransactionItem]] {
         Dictionary(grouping: transactionHistory, by: { $0.date })
     }


    
    var body: some View {
        VStack{
            // 상단 일자 , 선택
            VStack{
                HStack {
                    Picker("Year", selection: $selectedYear) {
                        ForEach(years, id: \.self) {
                            Text("\($0)년")
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    
                    Picker("Month", selection: $selectedMonth) {
                        ForEach(months, id: \.self) {
                            Text("\($0)월").tag($0)
                        }
                    }
                    .pickerStyle(.menu)
                    .cornerRadius(10)
                }
                .frame(maxWidth: .infinity)
                .frame(height : 60)
                .background(Color.inputBack)
                .cornerRadius(10)
                .padding(.bottom,10)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: 20) {
                    ForEach(shuffledArray , id: \.self){value in
                        Button(action: {
                            // 클릭된 금액을 chargeAmt에 추가
                            //                        if let amount = viewModel.extractAmount(from: value) {
                            //                            viewModel.chargeAmt += amount
                            //                        }
                        }) {
                            Text(value)
                                .foregroundStyle(Color.black)
                                .frame(width: 50, height: 20)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                        }
                        
                    }
                }.padding(.bottom,50)
            }.padding(30)
            
            // 이용 내역
            ScrollView {
                ForEach(Array(groupedTransactions.keys.sorted(by: >)), id: \.self) { date in
                    VStack(alignment:.leading) {
                        Text(date)
                            .padding(.bottom,5)
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .foregroundStyle(Color.black)
                            .overlay(Rectangle().frame(height: 1).foregroundColor(Color.gray) , alignment: .bottom)
                        ForEach(groupedTransactions[date]!, id: \.self) { transaction in
                            HistoryItemView(transaction: transaction)
                                .overlay(Rectangle().frame(height: 1).foregroundColor(Color.gray) , alignment: .bottom)
                        }
                    }
                }.padding()
            }
        }
        .customNavigationBar(
            centerView: {
                Text("머니 이용내역 조회")
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

struct HistoryItemView: View{
    var transaction: TransactionItem
    
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Text(transaction.title)
                Spacer()
                Text("\(transaction.amt)원")
            }
            HStack {
                Text(transaction.dt)
                Spacer()
                Text(transaction.type)
            }
            .foregroundColor(Color.gray)
        }.padding(.vertical,2)
    }
}


struct MoneyHistoryView_Previews: PreviewProvider {
    static var previews: some View {
 
        

        MoneyHistoryView()
    }
}

struct TransactionItem: Hashable {
    var date: String
    var title: String
    var dt: String
    var amt: Int
    var type: String
}
