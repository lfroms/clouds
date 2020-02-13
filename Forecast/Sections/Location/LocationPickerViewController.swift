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

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Dimension.LocationPicker.sectionSpacing
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureScrollView()

        scrollView.addSubview(stackView)
        configureStackViewConstraints()

        for _ in 1...20 {
            stackView.addArrangedSubview(viewBuilder.locationItem(icon: "location.fill", title: "Ottawa (Kanata – Orléans)"))
        }
    }

    private func configureScrollView() {
        scrollView.layoutMargins.left = Dimension.Header.padding
        scrollView.layoutMargins.right = Dimension.Header.padding
    }

    private func configureStackViewConstraints() {
        stackView.pinEdges([.leading, .trailing], to: scrollView, usingLayoutMargins: true)

        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Dimension.Header.padding).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
}
