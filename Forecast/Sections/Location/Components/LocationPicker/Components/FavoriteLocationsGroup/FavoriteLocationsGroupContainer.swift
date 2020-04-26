//
//  FavoriteLocationsGroupContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-14.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct FavoriteLocationsGroupContainer: Container {
    @EnvironmentObject private var locationPickerState: LocationPickerState
    @EnvironmentObject private var weatherService: WeatherService
    @EnvironmentObject private var locationFavoritesService: LocationFavoritesService

    var body: some View {
        FavoriteLocationsGroup(
            locations: locationFavoritesService.favoriteLocations,
            onSelectLocation: didSelect(location:),
            onDelete: didDelete(location:)
        )
        .equatable()
    }

    private func didSelect(location: StoredLocation) {
        locationPickerState.toggleLocationPicker(animated: true)

        guard locationFavoritesService.activeLocation != location else {
            return
        }

        locationFavoritesService.setActiveLocation(to: location)
        weatherService.setShouldFetchUpdatedWeather()
    }

    private func didDelete(location: StoredLocation) {
        locationFavoritesService.removeFavorite(location: location)
    }
}

struct FavoriteLocationsGroupContainer_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteLocationsGroupContainer()
    }
}
