//
//  CustomSafariViewController.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-08-25.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SafariServices
import UIKit

final class CustomSafariViewController: UIViewController {
    var url: URL? {
        didSet {
            configureChildViewController()
        }
    }

    var readerMode: Bool? {
        didSet {
            configureChildViewController()
        }
    }

    private var safariViewController: SFSafariViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureChildViewController()
    }

    private func configureChildViewController() {
        if let safariViewController = safariViewController {
            safariViewController.willMove(toParent: self)
            safariViewController.view.removeFromSuperview()
            safariViewController.removeFromParent()
            self.safariViewController = nil
        }

        guard let url = url else { return }

        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = readerMode ?? false

        let newSafariViewController = SFSafariViewController(url: url, configuration: config)
        addChild(newSafariViewController)
        newSafariViewController.view.frame = view.bounds
        view.addSubview(newSafariViewController.view)
        newSafariViewController.didMove(toParent: self)
        safariViewController = newSafariViewController
    }
}
