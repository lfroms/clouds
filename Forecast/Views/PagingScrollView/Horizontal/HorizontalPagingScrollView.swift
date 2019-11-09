//
//  HorizontalPagingScrollView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HorizontalPagingScrollView<Content>: UIViewControllerRepresentable where Content: View {
    var content: () -> Content

    var pageWidth: CGFloat
    var pageCount: Int

    init(pageWidth: CGFloat, pageCount: Int, @ViewBuilder content: @escaping () -> Content) {
        self.pageWidth = pageWidth
        self.pageCount = pageCount

        self.content = content
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<HorizontalPagingScrollView<Content>>) -> HorizontalPagingScrollViewController<Content> {
        let pagedViewController = HorizontalPagingScrollViewController<Content>(nibName: nil, bundle: nil)

        pagedViewController.add(content: content)

        return pagedViewController
    }

    func updateUIViewController(_ pagedViewController: HorizontalPagingScrollViewController<Content>, context: UIViewControllerRepresentableContext<HorizontalPagingScrollView<Content>>) {
        pagedViewController.pageWidth = pageWidth
        pagedViewController.pageCount = pageCount
    }
}
