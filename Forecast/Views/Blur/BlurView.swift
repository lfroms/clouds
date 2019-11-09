//
//  BlurView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-06.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    var tint: CGFloat?

    var blurPercentage: CGFloat? = 1

    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear

        let blurView = UIVisualEffectView()
        blurView.translatesAutoresizingMaskIntoConstraints = false

        view.insertSubview(blurView, at: 0)

        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        context.coordinator.animator = UIViewPropertyAnimator(duration: 1, curve: .linear) {
            blurView.effect = UIBlurEffect(style: .light)
            view.backgroundColor = self.backgroundColor
        }

        // Prevent animation reset when application loses focus.
        context.coordinator.animator.pausesOnCompletion = true

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<BlurView>) {
        guard let percentage = blurPercentage else {
            context.coordinator.animator.fractionComplete = 1

            return
        }

        context.coordinator.animator.fractionComplete = percentage
    }

    private var backgroundColor: UIColor {
        guard let tint = tint else {
            return .clear
        }

        return UIColor.clear.withAlphaComponent(tint)
    }

    func makeCoordinator() -> BlurView.Coordinator {
        return Coordinator()
    }

    class Coordinator: NSObject {
        var animator: UIViewPropertyAnimator!
    }
}

#if DEBUG
struct BlurView_Previews: PreviewProvider {
    static var previews: some View {
        BlurView(style: .light, tint: nil)
    }
}
#endif
