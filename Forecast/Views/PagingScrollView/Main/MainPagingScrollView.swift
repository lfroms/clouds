//
//  MainPagingScrollView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct MainPagingScrollView<Content>: UIViewControllerRepresentable where Content: View {
    var travelDistance: CGFloat
    @Binding var locked: Bool

    var content: () -> Content

    func makeUIViewController(context: Context) -> MainPagingScrollViewController {
        let vc = MainPagingScrollViewController()
        vc.hostingController.rootView = AnyView(self.content())
        return vc
    }

    func updateUIViewController(_ viewController: MainPagingScrollViewController, context: Context) {
        viewController.hostingController.rootView = AnyView(self.content())
        viewController.travelDistance = self.travelDistance
        viewController.updateScrollViewContentHeight()
        viewController.isLocked = self.locked
    }
}