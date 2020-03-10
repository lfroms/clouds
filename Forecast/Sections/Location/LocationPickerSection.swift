//
//  LocationPickerSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationPickerSection: View {
    @EnvironmentObject private var locationPickerState: LocationPickerState

    @EnvironmentObject private var weatherService: WeatherService
    @EnvironmentObject private var locationService: LocationService
    @EnvironmentObject private var locationSearchService: LocationSearchService
    @EnvironmentObject private var locationFavoritesService: LocationFavoritesService

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

    var body: some View {
        ZStack(alignment: .topLeading) {
            BlackBackground()
                .clipShape(RoundedCornerShape(cornerRadius: 22, style: .continuous, corners: [.topLeft, .topRight]))
                .edgesIgnoringSafeArea(.all)

            LocationPicker(data: locationPickerData, didPerformDismiss: handlePickerDismiss)
                .equatable()
        }
        .offset(searchOffset)
    }

    private var searchOffset: CGSize {
        return CGSize(width: 0, height: locationPickerState.presented ? 0 : Dimension.System.screenHeight)
    }

    private func handlePickerDismiss() {
        locationPickerState.toggleLocationPicker(animated: true)
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        LocationPickerSection()
    }
}
