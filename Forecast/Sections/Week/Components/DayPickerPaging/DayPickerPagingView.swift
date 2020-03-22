//
//  DayPickerPagingView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DayPickerPagingView<Content: View>: UIViewRepresentable {
    internal typealias UIViewType = UIView

    let itemWidth: CGFloat
    let spacing: CGFloat
    @Binding var currentPage: Int

    let content: () -> Content

    @inlinable public init(
        pageWidth: CGFloat,
        spacing: CGFloat,
        currentPage: Binding<Int>,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.itemWidth = pageWidth
        self.spacing = spacing
        self._currentPage = currentPage
        self.content = content
    }

    private let scrollView: UIScrollView = {
        let v = CustomPageSizeScrollView()
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

    var pageWidth: CGFloat {
        itemWidth + spacing
    }

    var halfItemWidth: CGFloat {
        itemWidth / 2
    }

    var halfPageWidth: CGFloat {
        pageWidth / 2
    }

    // MARK: - UIViewRepresentable

    func makeUIView(context: UIViewRepresentableContext<DayPickerPagingView<Content>>) -> UIViewType {
        touchPassthroughView.addSubview(scrollView)

        scrollView.delegate = context.coordinator

        scrollView.pinEdges([.top, .bottom], to: touchPassthroughView)
        scrollView.addConstraint(scrollView.widthAnchor.constraint(equalToConstant: pageWidth))
        scrollView.leadingAnchor.constraint(
            equalTo: touchPassthroughView.leadingAnchor,
            constant: (Dimension.System.screenWidth / 2) - halfItemWidth
        ).isActive = true

        configureAndAddContentView()

        return touchPassthroughView
    }

    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<DayPickerPagingView<Content>>) {
        context.coordinator.page(currentPage, scrollView: uiView.subviews.first as? UIScrollView)
    }

    // MARK: - Content View

    private func createContentView() -> UIView {
        let controller = UIHostingController(rootView: content())
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

    func makeCoordinator() -> DayPickerPagingViewCoordinator<Content> {
        return DayPickerPagingViewCoordinator(self)
    }
}

extension DayPickerPagingView: Equatable {
    static func == (lhs: DayPickerPagingView<Content>, rhs: DayPickerPagingView<Content>) -> Bool {
        lhs.itemWidth == rhs.itemWidth
            && lhs.spacing == rhs.spacing
            && lhs.currentPage == rhs.currentPage
    }
}
