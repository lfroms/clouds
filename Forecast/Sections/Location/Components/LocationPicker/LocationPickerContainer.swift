//
//  LocationPickerContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationPickerContainer: Container {
    @EnvironmentObject private var weatherService: WeatherService
    @EnvironmentObject private var locationService: LocationService
    @EnvironmentObject private var locationSearchService: LocationSearchService
    @EnvironmentObject private var locationFavoritesService: LocationFavoritesService

    var body: some View {
        LocationPicker(
            loading: loading,
            currentLocation: currentLocation,
            favoriteLocations: locationFavoritesService.favoriteLocations,
            searchQuery: locationSearchService.searchQuery,
            searchResults: locationSearchService.results
        )
        .equatable()
    }

    private var loading: Binding<Bool> {
        .constant(weatherService.loading || locationSearchService.loading)
    }

    private var currentLocation: Location? {
        guard
            let lastPlacemark = locationService.lastPlacemark,
            let cityName = lastPlacemark.locality,
            let coordinate = locationService.lastLocation?.coordinate
        else {
            return nil
        }

        let regionName = LocationNameHelper.shared.createRegionNameFrom(placemark: lastPlacemark)
        return Location(id: UUID(), name: cityName, regionName: regionName, coordinate: coordinate)
    }
}

struct LocationPickerContainer_Previews: PreviewProvider {
    static var previews: some View {
        LocationPickerContainer()
    }
}
