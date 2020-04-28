//
//  Alert.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-04-15.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import UIKit

final class Alert {
    public static func display(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

        DispatchQueue.main.async {
            viewControllerForDisplay()?.present(alertController, animated: true)
        }
    }

    public static func displayGenericError() {
        display(title: "Error", message: "An unexpected error has occurred. Please try again.")
    }

    private static func viewControllerForDisplay() -> UIViewController? {
        UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController
    }
}
