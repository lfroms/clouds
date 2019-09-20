//
//  ActivityIndicator.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-09-19.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI
import UIKit

struct ActivityIndicator: UIViewRepresentable {
    @Binding var animating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        animating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
