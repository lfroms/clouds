//
//  HorizontalPagingScrollViewController.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI
import UIKit

class HorizontalPagingScrollViewController: UIViewController, UIScrollViewDelegate {
    var pageWidth: CGFloat = 0
    var numberOfPages: Int = 0
    var activePage: Int = 0

    var didEndScrolling: ((_ page: Int) -> Void)?

    private var pageWidthConstraint: NSLayoutConstraint!

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
        let v = TouchPassthroughView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.insetsLayoutMarginsFromSafeArea = false
        return v
    }()

    var hostingController: UIHostingController<AnyView> = UIHostingController(rootView: AnyView(EmptyView()))

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self

        touchPassthroughView.addSubview(scrollView)
        view.addSubview(touchPassthroughView)

        touchPassthroughView.pinEdges([.all], to: view)
        scrollView.pinEdges([.leading, .top, .bottom], to: touchPassthroughView)

        hostingController.willMove(toParent: self)
        scrollView.addSubview(hostingController.view)
        hostingController.view.pinEdges([.all], to: scrollView)
        hostingController.didMove(toParent: self)

        hostingController.view.backgroundColor = .clear

        pageWidthConstraint = scrollView.widthAnchor.constraint(equalToConstant: pageWidth)
        NSLayoutConstraint.activate([pageWidthConstraint])

        updateScrollViewContentWidth()
    }

    func updateScrollViewContentWidth() {
        scrollView.contentSize.width = CGFloat(numberOfPages) * pageWidth
        pageWidthConstraint.constant = pageWidth

        scrollView.setNeedsLayout()
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        activePage = Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
        didEndScrolling?(activePage)
    }
}
