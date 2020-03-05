//
//  HorizontalPagingScrollView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HorizontalPagingScrollView<Content: View>: UIViewRepresentable {
    internal typealias UIViewType = UIView

    let pageWidth: CGFloat
    let numberOfPages: Int
    let didChangePage: (Int) -> Void

    let content: Content

    @inlinable public init(
        pageWidth: CGFloat,
        numberOfPages: Int,
        didChangePage: @escaping (_ page: Int) -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.pageWidth = pageWidth
        self.numberOfPages = numberOfPages
        self.didChangePage = didChangePage
        self.content = content()
    }

    private let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.showsVerticalScrollIndicator = false
        v.showsHorizontalScrollIndicator = false
        v.alwaysBounceVertical = false
        v.alwaysBounceHorizontal = true
        v.isPagingEnabled = true
        v.clipsToBounds = false
        v.insetsLayoutMarginsFromSafeArea = false
        v.contentInsetAdjustmentBehavior = .never
        return v
    }()

    private let touchPassthroughView: TouchPassthroughView = {
        TouchPassthroughView()
    }()

    // MARK: - UIViewRepresentable

    func makeUIView(context: UIViewRepresentableContext<HorizontalPagingScrollView<Content>>) -> UIViewType {
        touchPassthroughView.addSubview(scrollView)

        scrollView.delegate = context.coordinator

        scrollView.pinEdges([.leading, .top, .bottom], to: touchPassthroughView)
        scrollView.addConstraint(scrollView.widthAnchor.constraint(equalToConstant: pageWidth))

        configureAndAddContentView()

        return touchPassthroughView
    }

    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<HorizontalPagingScrollView<Content>>) {
        scrollView.clear()
        configureAndAddContentView()
    }

    // MARK: - Content View

    private func createContentView() -> UIView {
        let controller = UIHostingController(rootView: content)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        controller.view.backgroundColor = .clear

        return controller.view
    }

    private func configureAndAddContentView() {
        let contentView = createContentView()
        scrollView.addSubview(contentView)
        scrollView.contentSize = contentView.intrinsicContentSize

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }

    // MARK: - Coordinator

    func makeCoordinator() -> HorizontalPagingScrollView<Content>.Coordinator {
        return Coordinator(didChangePage: didChangePage)
    }

    internal class Coordinator: NSObject, UIScrollViewDelegate {
        private let didChangePage: (Int) -> Void

        init(didChangePage: @escaping (Int) -> Void) {
            self.didChangePage = didChangePage
        }

        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let activePage = Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
            didChangePage(activePage)
        }
    }
}
