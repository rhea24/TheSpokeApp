//
//  WebView.swift
//  TheSpoke
//
//  Created by Rhea Malik on 11/5/22.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    var content: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(content, baseURL: nil)
    }
}
