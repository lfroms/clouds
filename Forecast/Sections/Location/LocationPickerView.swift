//
//  LocationPickerView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationPickerView: UIViewControllerRepresentable {
    internal typealias UIViewControllerType = LocationPickerViewController

    var currentLocationName: String = ""

    let didPerformDismiss: (() -> Void)?

    internal func makeUIViewController(context: Context) -> UIViewControllerType {
        let vc = UIViewControllerType()
        vc.locationName = currentLocationName
        vc.didPerformDismiss = didPerformDismiss
        return vc
    }

    internal func updateUIViewController(_ viewController: UIViewControllerType, context: Context) {
        viewController.locationName = currentLocationName
    }
}
