//
//  HorizontalPagingScrollView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HorizontalPagingScrollView<Content>: UIViewControllerRepresentable where Content: View {
    var pageWidth: CGFloat

    var content: () -> Content

    func makeUIViewController(context: Context) -> HorizontalPagingScrollViewController {
        let vc = HorizontalPagingScrollViewController()
        vc.hostingController.rootView = AnyView(content())
        return vc
    }

    func updateUIViewController(_ viewController: HorizontalPagingScrollViewController, context: Context) {
        viewController.hostingController.rootView = AnyView(content())
        viewController.pageWidth = pageWidth
        viewController.updateScrollViewContentWidth()
    }
}
