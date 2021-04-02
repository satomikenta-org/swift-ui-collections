//
//  WebView.swift
//  health-app
//
//  Created by 里見健太 on 2021/04/02.
//

import SwiftUI
import UIKit
import WebKit

struct WebView: View {
    var body: some View {
        VStack {
                    Text("Hello, world!")
                        .padding()
                    UIKitWebView(url: "https://github.com/yorifuji")
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                        .shadow(radius: 7)
                        .padding()
                }
    }
}

struct UIKitWebView: UIViewRepresentable {
    let url: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: url)!))
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView()
    }
}
