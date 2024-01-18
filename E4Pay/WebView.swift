//
//  WebView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/14/24.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let request: URLRequest
    private var webView: WKWebView?
    private var contentController: ContentController
    private var daumWebViewModel: DaumWebViewModel

    init(request: URLRequest, daumWebViewModel: DaumWebViewModel) {
        self.webView = WKWebView()
        self.request = request
        self.contentController = ContentController(daumWebViewModel: daumWebViewModel)
        self.webView?.configuration.userContentController.add(self.contentController, name: "callBackHandler")
        self.daumWebViewModel = daumWebViewModel
    }

    
    func makeUIView(context: Context) -> WKWebView {
        return webView!
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject {
        let parent: WebView
        
        init(parent: WebView) {
            self.parent = parent
        }
    }
}
