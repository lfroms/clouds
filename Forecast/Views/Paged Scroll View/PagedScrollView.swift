//
//  PagedScrollView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct PagedScrollView<Content>: UIViewControllerRepresentable where Content: View {
    typealias UIViewControllerType = PagedScrollViewController

    var content: () -> Content

    var pageWidth: CGFloat
    var pageCount: Int

    init(pageWidth: CGFloat, pageCount: Int, @ViewBuilder content: @escaping () -> Content) {
        self.pageWidth = pageWidth
        self.pageCount = pageCount

        self.content = content
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<PagedScrollView<Content>>) -> PagedScrollViewController<Content> {
        let pagedViewController = PagedScrollViewController<Content>(nibName: nil, bundle: nil)

        pagedViewController.add(content: content)

        return pagedViewController
    }

    func updateUIViewController(_ pagedViewController: PagedScrollViewController<Content>, context: UIViewControllerRepresentableContext<PagedScrollView<Content>>) {
        pagedViewController.pageWidth = pageWidth
        pagedViewController.pageCount = pageCount
    }
}
