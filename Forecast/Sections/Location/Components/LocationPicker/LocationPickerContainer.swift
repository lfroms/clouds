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
            currentLocationWeather: weatherService.currentLocationShortForm,
            favoriteLocations: locationFavoritesService.favoriteLocations,
            favoriteLocationsWeather: weatherService.favoriteLocations,
            searchQuery: locationSearchService.searchQuery,
            searchResults: locationSearchService.results,
            onSelectCurrentLocation: self.onSelectCurrentLocation,
            onSelectFavoriteLocation: self.onSelectLocation,
            onSelectSearchResult: self.onSelectLocation,
            onStar: self.onStar
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

    private func onSelectCurrentLocation(_: Location) {
//        locationPickerState.toggleLocationPicker(animated: true)

        locationFavoritesService.clearActiveLocation()
        weatherService.setShouldFetchUpdatedWeather()
    }

    private func onSelectLocation(_ location: Location) {
//        locationPickerState.toggleLocationPicker(animated: true)

        locationFavoritesService.saveActiveLocation(location: location)
        weatherService.setShouldFetchUpdatedWeather()
    }

    private func onStar(_ location: Location) {
        if locationFavoritesService.favoriteLocations.contains(location) {
            locationFavoritesService.favoriteLocations.removeAll { $0 == location }

            return
        }

        locationFavoritesService.favoriteLocations.append(location)
    }
}

struct LocationPickerContainer_Previews: PreviewProvider {
    static var previews: some View {
        LocationPickerContainer()
    }
}
