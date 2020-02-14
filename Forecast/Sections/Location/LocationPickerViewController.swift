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

    // TODO: - Remove/temporary
    var locationName: String = "" {
        didSet {
            render()
        }
    }

    private lazy var topInset: CGFloat = {
        (2 * Dimension.Header.padding) + Dimension.Header.omniBarHeight
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Dimension.LocationPicker.sectionSpacing
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        configureScrollView()

        scrollView.addSubview(stackView)
        configureStackViewConstraints()

        super.viewDidLoad()
    }

    private func render() {
        stackView.subviews.forEach { subview in
            subview.removeFromSuperview()
        }

        let currentLocationLabel = UILabel()
        currentLocationLabel.text = "Current location"
        currentLocationLabel.font = UIFont.preferredFont(for: .callout, weight: .semibold)
        currentLocationLabel.textColor = .white

        let currentLocationStack = UIStackView()
        currentLocationStack.axis = .vertical
        currentLocationStack.distribution = .equalSpacing
        currentLocationStack.spacing = 10
        currentLocationStack.alignment = .fill

        currentLocationStack.addArrangedSubview(currentLocationLabel)

        currentLocationStack.addArrangedSubview(viewBuilder.locationItem(icon: "location.fill", title: locationName))

        stackView.addArrangedSubview(currentLocationStack)
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
        stackView.pinEdges([.leading, .trailing], to: scrollView, usingLayoutMargins: true)

        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Dimension.Header.padding).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
}
