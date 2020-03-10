//
//  LocationPicker.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationPicker: Equatable {
    static func == (lhs: LocationPicker, rhs: LocationPicker) -> Bool {
        lhs.data == rhs.data
    }
    
    var data: LocationPickerData
    var didPerformDismiss: () -> Void
}

extension LocationPicker: UIViewControllerRepresentable {
    internal typealias UIViewControllerType = LocationPickerViewController

    internal func makeUIViewController(context: Context) -> UIViewControllerType {
        let viewController = UIViewControllerType()
        viewController.data = data
        viewController.didPerformDismiss = self.didPerformDismiss
        return viewController
    }

    internal func updateUIViewController(_ viewController: UIViewControllerType, context: Context) {
        viewController.data = data
    }
}
