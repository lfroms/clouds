//
//  WebView.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-05-01.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Combine
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let request: URLRequest
    @Binding var loading: Bool

    @State private var state: WebViewState = .initial

    internal enum WebViewState {
        case initial
        case loaded
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.scrollView.backgroundColor = .clear
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard state == .initial else {
            return
        }

        uiView.load(request)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(loading: $loading, state: $state)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        @Binding var loading: Bool
        @Binding var state: WebViewState

        init(loading: Binding<Bool>, state: Binding<WebViewState>) {
            self._loading = loading
            self._state = state
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            loading = true
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            loading = false
            state = .loaded
        }
    }
}

extension WebView: Equatable {
    static func == (lhs: WebView, rhs: WebView) -> Bool {
        lhs.request == rhs.request
    }
}
