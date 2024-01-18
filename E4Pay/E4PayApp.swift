//
//  E4PayApp.swift
//  E4Pay
//
//  Created by 20-N311 on 1/5/24.
//

import SwiftUI


@main
struct E4PayApp: App {
//    @StateObject var userData: UserData = UserData(hpNo: "", mbrNm: "", monySertNo: "", instId: "", instNm: "", acntNo: "")
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
//                .environmentObject(userData)
        }
    }
}
