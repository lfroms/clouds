//
//  BlurView.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-07-06.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ShadowView: UIViewRepresentable {
    var offset: CGSize = CGSize(width: 0, height: 0)
    var radius: CGFloat = 10
    var opacity: CGFloat = 0.5
    var color: UIColor = UIColor.black
    var cornerRadius: Float = 0.0
    var isCircle: Bool = false
    var showOnlyOutsideBounds: Bool = true

    func makeUIView(context: UIViewRepresentableContext<ShadowView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear

        let shadowView = UIShadowView(frame: .zero)
        shadowView.translatesAutoresizingMaskIntoConstraints = false

        shadowView.offset = offset
        shadowView.radius = radius
        shadowView.opacity = opacity
        shadowView.color = color
        shadowView.cornerRadius = cornerRadius
        shadowView.isCircle = isCircle
        shadowView.showOnlyOutsideBounds = showOnlyOutsideBounds

        view.insertSubview(shadowView, at: 0)

        NSLayoutConstraint.activate([
            shadowView.heightAnchor.constraint(equalTo: view.heightAnchor),
            shadowView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<ShadowView>) {}
}

struct ShadowView_Previwws: PreviewProvider {
    static var previews: some View {
        ShadowView(
            offset: CGSize(width: 0, height: 0),
            radius: 0,
            opacity: 1,
            color: .black,
            cornerRadius: 0,
            isCircle: false,
            showOnlyOutsideBounds: false
        )
    }
}
