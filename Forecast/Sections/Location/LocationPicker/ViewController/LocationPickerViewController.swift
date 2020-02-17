//
//  LocationPickerViewController.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-10.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Combine
import UIKit

class LocationPickerViewController: DismissableScrollViewController {
    private let viewBuilder = LocationPickerViewBuilder()

    var data: LocationPickerData? {
        didSet {
            renderIfNeeded(oldValue: oldValue)
        }
    }

    private lazy var topInset: CGFloat = {
        (2 * Dimension.Header.padding) + Dimension.Header.omniBarHeight
    }()

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Dimension.LocationPicker.sectionSpacing
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        configureScrollView()

        scrollView.addSubview(mainStackView)
        configureStackViewConstraints()

        super.viewDidLoad()
    }

    private func renderIfNeeded(oldValue: LocationPickerData?) {
        guard data != nil, oldValue != data else {
            return
        }

        render()
    }

    private func render() {
        mainStackView.clear()

        guard let data = data else {
            return
        }

        mainStackView.addArrangedSubviews(viewBuilder.sections(data: data))
    }

    private func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.isPagingEnabled = false
        scrollView.clipsToBounds = false
        scrollView.insetsLayoutMarginsFromSafeArea = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.keyboardDismissMode = .onDrag
        scrollView.contentInset.top = topInset
        scrollView.verticalScrollIndicatorInsets.top = topInset

        scrollView.layoutMargins.left = Dimension.Header.padding
        scrollView.layoutMargins.right = Dimension.Header.padding
    }

    private func configureStackViewConstraints() {
        mainStackView.pinEdges([.leading, .trailing], to: scrollView, usingLayoutMargins: true)

        mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Dimension.Header.padding).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
}
