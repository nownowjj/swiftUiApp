//
//  ContentView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/5/24.
//
import SwiftUI


struct ContentView: View {
    @StateObject var viewModel = EntryViewModel()
    
    var body: some View {
        Group {
             if viewModel.isAvailableUUid {
                 NavigationView { 
                     HomeView()
                 }
             } else {
                 IntroView()
                    
             }
         }
         .onAppear {
             // 앱 진입 시 EntryViewModel에서 API 호출
             viewModel.action(state: .autoLogin, param: "")
         }
    }
}

#Preview {
    ContentView()
}

