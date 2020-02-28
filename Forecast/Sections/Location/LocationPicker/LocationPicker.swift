//
//  LocationPicker.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationPicker {
    @Binding private(set) var appState: AppState
    @Binding private(set) var provider: WeatherProvider
    @Binding private(set) var locationPickerState: LocationPickerState

    let didPerformDismiss: (() -> Void)?

    private var currentLocationName: String? {
        guard let placemark = provider.locationManager.lastPlacemark else {
            return nil
        }

        return placemark.locality
    }

    private var currentRegionName: String? {
        guard let placemark = provider.locationManager.lastPlacemark else {
            return nil
        }

        return LocationNameHelper.shared.createRegionNameFrom(placemark: placemark)
    }

    private var locationPickerData: LocationPickerData {
        var currentLocation: Location?

        if let name = currentLocationName, let regionName = currentRegionName, let location = provider.locationManager.lastLocation {
            currentLocation = Location(name: name, regionName: regionName, coordinate: location.coordinate)
        }

        return LocationPickerData(
            currentLocation: currentLocation,
            favoriteLocations: appState.favoriteLocations,
            searchQuery: locationPickerState.searchQuery,
            state: locationPickerState.searchQuery.isEmpty ? .normal : .searching,
            searchResults: locationPickerState.locationResults,
            loadingCurrentLocation: provider.loading,
            loadingFavorites: provider.loading,
            loadingSearch: locationPickerState.loading
        )
    }
}

extension LocationPicker: UIViewControllerRepresentable {
    internal typealias UIViewControllerType = LocationPickerViewController

    internal func makeUIViewController(context: Context) -> UIViewControllerType {
        let viewController = UIViewControllerType()
        viewController.data = locationPickerData
        viewController.didPerformDismiss = didPerformDismiss
        return viewController
    }

    internal func updateUIViewController(_ viewController: UIViewControllerType, context: Context) {
        viewController.data = locationPickerData
    }
}
