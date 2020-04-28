//
//  UIStackView+SetBackground.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-02-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import UIKit

extension UIStackView {
    func setBackground(color: UIColor, cornerRadius: CGFloat? = nil) {
        let backgroundView = UIView(frame: bounds)
        backgroundView.backgroundColor = color

        if let cornerRadius = cornerRadius {
            backgroundView.layer.cornerRadius = cornerRadius
            backgroundView.layer.masksToBounds = true
        }

        backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(backgroundView, at: 0)
    }
}
