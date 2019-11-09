//
//  MainPagingScrollViewController.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-08.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI
import UIKit

final class MainPagingScrollViewController: UIViewController, UIScrollViewDelegate {
    var travelDistance: CGFloat = 0.0
    var isLocked: Bool = false {
        didSet {
            self.lockSettingDidChange()
        }
    }

    private let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.showsVerticalScrollIndicator = false
        v.showsHorizontalScrollIndicator = false
        v.alwaysBounceVertical = true
        v.alwaysBounceHorizontal = false
        v.isPagingEnabled = true
        v.clipsToBounds = false
        v.insetsLayoutMarginsFromSafeArea = false
        v.contentInsetAdjustmentBehavior = .never
        return v
    }()

    var hostingController: UIHostingController<AnyView> = UIHostingController(rootView: AnyView(EmptyView()))

    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollView.delegate = self

        self.view.addSubview(self.scrollView)
        self.scrollView.pinEdges(to: self.view)

        self.hostingController.willMove(toParent: self)
        self.scrollView.addSubview(self.hostingController.view)
        self.hostingController.view.pinEdges(to: self.scrollView)
        self.hostingController.didMove(toParent: self)

        self.hostingController.view.backgroundColor = .clear

        self.updateScrollViewContentHeight()
    }

    func updateScrollViewContentHeight() {
        let height = self.travelDistance + self.scrollView.bounds.height
        self.scrollView.contentSize.height = height

        self.scrollView.setNeedsLayout()
    }

    private func lockSettingDidChange() {
        self.scrollView.isScrollEnabled = !self.isLocked
        self.scrollView.scrollToTop()
    }
}
