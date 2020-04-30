//
//  SafariView.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-08-25.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable {
    typealias UIViewControllerType = CustomSafariViewController

    var url: URL?
    var readerMode: Bool?

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> CustomSafariViewController {
        return CustomSafariViewController()
    }

    func updateUIViewController(_ safariViewController: CustomSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        safariViewController.url = url
        safariViewController.readerMode = readerMode
    }
}
