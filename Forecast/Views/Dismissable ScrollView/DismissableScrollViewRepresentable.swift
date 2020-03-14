//
//  DismissableScrollViewRepresentable.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DismissableScrollViewRepresentable<Content: View>: UIViewControllerRepresentable {
    typealias UIViewControllerType = DismissableScrollViewHostingController<Content>

    let message: String
    let dismissAction: () -> Void
    let content: Content

    func makeUIViewController(context: Context) -> UIViewControllerType {
        return DismissableScrollViewHostingController(message: message, dismissAction: dismissAction, rootView: content)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        uiViewController.rootView = content
    }
}
