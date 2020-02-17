//
//  UIStackView+AddArrangedSubviews.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-16.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ newSubviews: [UIView]) {
        newSubviews.forEach { subview in
            addArrangedSubview(subview)
        }
    }

    func clear() {
        subviews.forEach { subview in
            subview.removeFromSuperview()
        }
    }
}
