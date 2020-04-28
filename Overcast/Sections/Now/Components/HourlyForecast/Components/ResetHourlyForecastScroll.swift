//
//  ResetHourlyForecastScroll.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-04-28.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

/// Workaround to reset scroll view when tab changes
struct ResetHourlyForecastScroll: ViewModifier {
    @EnvironmentObject private var appState: AppState

    func body(content: Content) -> some View {
        content
            .introspectScrollView { scrollView in
                guard self.appState.activeSection != .now, scrollView.contentOffset.x != .zero else {
                    return
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    scrollView.setContentOffset(.zero, animated: true)
                }
            }
    }
}

struct IntrospectionView: UIViewRepresentable {
    let customize: (UIScrollView) -> Void

    func makeUIView(context: Context) -> some UIView {
        UIView(frame: .zero)
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let scrollView = uiView.superview(of: UIScrollView.self) else {
            return
        }

        customize(scrollView)
    }
}

extension View {
    func introspectScrollView(customize: @escaping (UIScrollView) -> Void) -> some View {
        overlay(IntrospectionView(customize: customize))
    }
}

extension UIView {
    func superview<T>(of type: T.Type) -> T? {
        return superview as? T ?? superview?.superview(of: type)
    }
}
