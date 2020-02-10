//
//  DismissableScrollView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DismissableScrollView<Content>: UIViewControllerRepresentable where Content: View {
    internal typealias UIViewControllerType = DismissableScrollViewController

    private let didPerformDismiss: (() -> Void)?
    private let content: Content

    @inlinable init(didPerformDismiss: (() -> Void)?, @ViewBuilder content: @escaping () -> Content) {
        self.didPerformDismiss = didPerformDismiss
        self.content = content()
    }

    internal func makeUIViewController(context: Context) -> UIViewControllerType {
        let vc = UIViewControllerType()
        vc.hostingController.rootView = AnyView(self.content)
        vc.didPerformDismiss = self.didPerformDismiss
        return vc
    }

    internal func updateUIViewController(_ viewController: UIViewControllerType, context: Context) {
        viewController.hostingController.rootView = AnyView(self.content)
    }
}
