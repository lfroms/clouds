//
//  DayPickerItemView.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-09-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation
import UIKit

final class DayPickerItemView: UIView {
    var data: DayPickerPagingView.Item {
        didSet {
            setTexts()
            animateChanges()
        }
    }

    let onSelect: () -> Void

    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 2
        return view
    }()

    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .caption1).withWeight(.bold)
        label.textColor = .white
        label.isUserInteractionEnabled = false

        return label
    }()

    private lazy var bottomLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body).withWeight(.black)
        label.textColor = .white
        label.isUserInteractionEnabled = false

        return label
    }()

    private lazy var circleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 0.14)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = Dimension.WeekSection.DayPicker.bubbleSize / 2
        view.isUserInteractionEnabled = false
        return view
    }()

    private lazy var activeCircleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0
        view.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = Dimension.WeekSection.DayPicker.bubbleSize / 2
        view.isUserInteractionEnabled = false
        return view
    }()

    private lazy var button: UIButton = {
        let button = FadeButton()
        let action = UIAction(title: "") { _ in
            self.onSelect()
        }

        button.addAction(action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private func animateChanges() {
        UIView.transition(with: topLabel, duration: 0.2, options: .transitionCrossDissolve) {
            self.topLabel.textColor = self.data.active ? .black : .white
        }

        UIView.transition(with: bottomLabel, duration: 0.2, options: .transitionCrossDissolve) {
            self.bottomLabel.textColor = self.data.active ? .black : .white
        }

        UIView.animate(withDuration: 0.2) {
            self.activeCircleView.alpha = self.data.active ? 1 : 0
        }

        if data.active {
            activeCircleView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1) {
                self.activeCircleView.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }
    }

    private func setTexts() {
        topLabel.text = data.day
        bottomLabel.text = String(data.date)
    }

    init(frame: CGRect, data: DayPickerPagingView.Item, onSelect: @escaping () -> Void) {
        self.data = data
        self.onSelect = onSelect

        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = false

        stackView.addArrangedSubview(topLabel)
        stackView.addArrangedSubview(bottomLabel)

        button.addSubview(circleView)
        button.addSubview(activeCircleView)
        button.addSubview(stackView)

        addSubview(button)

        configureConstraints()
        setTexts()
    }

    private func configureConstraints() {
        stackView.pinEdges([.leading, .trailing], to: button, usingLayoutMargins: false)
        stackView.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true

        button.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        button.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        circleView.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        circleView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        circleView.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        circleView.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true

        activeCircleView.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        activeCircleView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        activeCircleView.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        activeCircleView.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true

        heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        widthAnchor.constraint(equalToConstant: frame.width).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
