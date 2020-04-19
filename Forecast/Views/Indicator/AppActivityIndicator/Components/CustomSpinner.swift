//
//  CustomSpinner.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-04-18.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct CustomSpinner: UIViewRepresentable {
    var isWhite: Bool

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        view.translatesAutoresizingMaskIntoConstraints = false

        let layer = CAShapeLayer()
        layer.frame = view.frame
        layer.path = UIBezierPath(ovalIn: view.bounds).cgPath
        layer.lineWidth = 2
        layer.strokeStart = 0
        layer.strokeEnd = 0.75
        layer.fillColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        layer.strokeColor =
            isWhite
                ? CGColor(srgbRed: 255, green: 255, blue: 255, alpha: 1)
                : CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)

        view.layer.addSublayer(layer)
        view.backgroundColor = .clear

        let rotationPoint = CGPoint(x: layer.frame.midX, y: layer.frame.midY)

        let width = layer.frame.width
        let height = layer.frame.height
        let minX = layer.frame.minX
        let minY = layer.frame.minY

        let anchorPoint = CGPoint(
            x: (rotationPoint.x - minX) / width,
            y: (rotationPoint.y - minY) / height
        )

        layer.anchorPoint = anchorPoint
        layer.position = rotationPoint

        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = 0.8
        rotateAnimation.repeatCount = Float.infinity
        layer.add(rotateAnimation, forKey: nil)

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
