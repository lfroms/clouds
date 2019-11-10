//
//  SystemActivityIndicator.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-09-19.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI
import UIKit

struct SystemActivityIndicator: UIViewRepresentable {
    @Binding var animating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<SystemActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<SystemActivityIndicator>) {
        animating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
