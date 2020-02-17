//
//  LocationPicker.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationPicker {
    @EnvironmentObject private var locationManager: LocationManager

    let didPerformDismiss: (() -> Void)?

    private var currentLocationName: String? {
        guard let placemark = locationManager.lastPlacemark else {
            return nil
        }

        var components: [String] = []

        if let city = placemark.locality {
            components.append(city)
        }

        if let administrativeArea = placemark.administrativeArea {
            components.append(administrativeArea)
        }

        if let country = placemark.country {
            components.append(country)
        }

        return components.joined(separator: ", ")
    }

    private var locationData: LocationPickerData? {
        guard let name = currentLocationName, let location = locationManager.lastLocation else {
            return nil
        }

        let currentLocation = Location(name: name, coordinate: location.coordinate)

        return LocationPickerData(
            currentLocation: currentLocation,
            savedLocations: savedLocations,
            state: .normal)
    }

    private var savedLocations: [Location] {
        if let data = UserDefaults.standard.value(forKey: "saved_locations") as? Data {
            let locations = try? PropertyListDecoder().decode([Location].self, from: data)

            return locations ?? []
        }

        return []
    }
}

extension LocationPicker: UIViewControllerRepresentable {
    internal typealias UIViewControllerType = LocationPickerViewController

    internal func makeUIViewController(context: Context) -> UIViewControllerType {
        let viewController = UIViewControllerType()
        viewController.didPerformDismiss = didPerformDismiss
        return viewController
    }

    internal func updateUIViewController(_ viewController: UIViewControllerType, context: Context) {
        viewController.data = locationData
    }
}
