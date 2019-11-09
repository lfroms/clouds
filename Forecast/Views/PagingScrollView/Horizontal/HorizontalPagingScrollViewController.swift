//
//  HorizontalPagingScrollViewController.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI
import UIKit

class HorizontalPagingScrollViewController<Content>: UIViewController, UIScrollViewDelegate where Content: View {
    var pageWidth: CGFloat = 0.0 {
        didSet {
            adjustDimensions()
        }
    }

    var pageCount: Int = 0 {
        didSet {
            adjustDimensions()
        }
    }

    var activePage: Int = 0

    private var pageWidthConstraint: NSLayoutConstraint!

    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.showsVerticalScrollIndicator = false
        v.showsHorizontalScrollIndicator = false
        v.alwaysBounceVertical = false
        v.alwaysBounceHorizontal = true
        v.isPagingEnabled = true
        v.clipsToBounds = false
        return v
    }()

    let clipView: TouchPassthroughView = {
        let v = TouchPassthroughView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self

        clipView.addSubview(scrollView)
        view.addSubview(clipView)

        scrollView.leftAnchor.constraint(equalTo: clipView.leftAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: clipView.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: clipView.bottomAnchor, constant: 0).isActive = true

        clipView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        clipView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        clipView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        clipView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

        pageWidthConstraint = scrollView.widthAnchor.constraint(equalToConstant: pageWidth)
        NSLayoutConstraint.activate([pageWidthConstraint])

        adjustDimensions()
    }

    private func adjustDimensions() {
        pageWidthConstraint.constant = pageWidth

        let contentWidth = pageWidth * CGFloat(pageCount)
        scrollView.contentSize = CGSize(width: contentWidth, height: 0)

        scrollView.setNeedsLayout()
    }

    var contentView: UIView!

    var contentVC: UIViewController!

    func add(@ViewBuilder content: @escaping () -> Content) {
        contentVC = UIHostingController(rootView: content())
        contentView = contentVC.view!
        contentView.backgroundColor = .clear

        scrollView.addSubview(contentView)

        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true

        contentView.translatesAutoresizingMaskIntoConstraints = false

        contentView.widthAnchor.constraint(greaterThanOrEqualTo: scrollView.widthAnchor).isActive = true
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        activePage = Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
    }
}
