//
//  ResettableScrollViewRepresentable.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-04-26.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ResettableScrollViewRepresentable<Content: View>: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIHostingController<Content>

    @EnvironmentObject private var appState: AppState

    let content: Content

    func makeUIViewController(context: Context) -> UIViewControllerType {
        let controller = UIHostingController(rootView: content)
        controller.view.backgroundColor = .clear
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if appState.activeSection != .now {
            guard let scrollView = findUIScrollView(view: uiViewController.view) else {
                return
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                if scrollView.contentOffset.x > .zero {
                    scrollView.setContentOffset(.zero, animated: true)
                }
            }
        }
    }

    private func findUIScrollView(view: UIView?) -> UIScrollView? {
        if view?.isKind(of: UIScrollView.self) ?? false {
            return (view as? UIScrollView)
        }

        for v in view?.subviews ?? [] {
            if let vc = findUIScrollView(view: v) {
                return vc
            }
        }

        return nil
    }
}
