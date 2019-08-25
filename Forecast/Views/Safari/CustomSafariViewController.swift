//
//  CustomSafariViewController.swift
//  Forecast
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

        let newSafariViewController = SFSafariViewController(url: url)
        addChild(newSafariViewController)
        newSafariViewController.view.frame = view.bounds
        view.addSubview(newSafariViewController.view)
        newSafariViewController.didMove(toParent: self)
        safariViewController = newSafariViewController
    }
}
