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
    @Binding private(set) var weatherService: WeatherService
    @Binding private(set) var locationService: LocationService
    @Binding private(set) var locationSearchService: LocationSearchService
    @Binding private(set) var locationFavoritesService: LocationFavoritesService

    let didPerformDismiss: (() -> Void)?

    private var currentLocationName: String? {
        guard let placemark = locationService.lastPlacemark else {
            return nil
        }

        return placemark.locality
    }

    private var currentRegionName: String? {
        guard let placemark = locationService.lastPlacemark else {
            return nil
        }

        return LocationNameHelper.shared.createRegionNameFrom(placemark: placemark)
    }

    private var locationPickerData: LocationPickerData {
        var currentLocation: Location?

        if let name = currentLocationName, let regionName = currentRegionName, let location = locationService.lastLocation {
            currentLocation = Location(name: name, regionName: regionName, coordinate: location.coordinate)
        }

        return LocationPickerData(
            currentLocation: currentLocation,
            favoriteLocations: locationFavoritesService.favoriteLocations,
            searchQuery: locationSearchService.searchQuery,
            state: locationSearchService.searchQuery.isEmpty ? .normal : .searching,
            searchResults: locationSearchService.results,
            loadingCurrentLocation: weatherService.loading,
            loadingFavorites: weatherService.loading,
            loadingSearch: locationSearchService.loading
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
