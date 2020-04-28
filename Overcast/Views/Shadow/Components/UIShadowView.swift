//
//  UIShadowView.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2019-09-15.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import UIKit

public class UIShadowView: UIView {
    var offset: CGSize = CGSize(width: 0, height: 0)
    var radius: CGFloat = 10
    var opacity: CGFloat = 0.5
    var color: UIColor = UIColor.black
    var cornerRadius: Float = 0.0
    var isCircle: Bool = false
    var showOnlyOutsideBounds: Bool = true

    public override func layoutSubviews() {
        super.layoutSubviews()

        var cornerRadius = self.cornerRadius

        if self.isCircle {
            cornerRadius = Float(min(frame.height, frame.width) / 2.0)
        }

        if self.showOnlyOutsideBounds {
            let maskLayer = CAShapeLayer()
            let path = CGMutablePath()

            let roundedRectPath =
                UIBezierPath(
                    roundedRect: bounds.inset(by: UIEdgeInsets.zero),
                    cornerRadius: CGFloat(cornerRadius)
                ).cgPath

            path.addPath(roundedRectPath)

            let edgeInsets =
                UIEdgeInsets(
                    top: -self.offset.height - self.radius * 2,
                    left: -self.offset.width - self.radius * 2,
                    bottom: -self.offset.height - self.radius * 2,
                    right: -self.offset.width - self.radius * 2
                )

            let insetRectPath =
                UIBezierPath(
                    roundedRect: bounds.inset(by: edgeInsets),
                    cornerRadius: CGFloat(cornerRadius)
                ).cgPath

            path.addPath(insetRectPath)

            maskLayer.backgroundColor = UIColor.black.cgColor
            maskLayer.path = path
            maskLayer.fillRule = .evenOdd

            self.layer.mask = maskLayer

        } else {
            self.layer.masksToBounds = false
        }

        self.layer.shadowOffset = self.offset
        self.layer.shadowRadius = self.radius
        self.layer.shadowOpacity = Float(self.opacity)
        self.layer.shadowColor = self.color.cgColor
        self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: CGFloat(cornerRadius)).cgPath
    }
}
