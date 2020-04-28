//
//  DrawerScrollView.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DrawerScrollView<Content: View>: UIViewRepresentable {
    @Binding internal var travelDistance: CGFloat
    @Binding internal var locked: Bool
    private var content: () -> Content

    @inlinable init(
        travelDistance: Binding<CGFloat>,
        locked: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._travelDistance = travelDistance
        self._locked = locked
        self.content = content
    }

    private var hostingController: UIHostingController<AnyView> = {
        let hostingController = UIHostingController(rootView: AnyView(EmptyView()))
        hostingController.view.backgroundColor = .clear
        return hostingController
    }()

    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = TransparentTouchScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.isPagingEnabled = true
        scrollView.insetsLayoutMarginsFromSafeArea = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.clipsToBounds = false

        scrollView.delegate = context.coordinator
        hostingController.rootView = AnyView(content())

        scrollView.addSubview(hostingController.view)
        hostingController.view.pinEdges([.all], to: scrollView)

        return scrollView
    }

    func updateUIView(_ scrollView: UIScrollView, context: Context) {
        let height = travelDistance + scrollView.frame.height
        scrollView.contentSize.height = height

        if scrollView.isScrollEnabled == locked {
            scrollView.isScrollEnabled = !locked
            scrollView.scrollToTop()
        }
    }

    func makeCoordinator() -> DrawerScrollViewCoordinator<Content> {
        DrawerScrollViewCoordinator<Content>(travelDistance: $travelDistance)
    }
}

extension DrawerScrollView: Equatable {
    static func == (lhs: DrawerScrollView, rhs: DrawerScrollView) -> Bool {
        lhs.travelDistance == rhs.travelDistance && lhs.locked == rhs.locked
    }
}
