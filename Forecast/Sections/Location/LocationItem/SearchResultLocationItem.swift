//
//  SearchResultLocationItem.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-27.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SearchResultLocationItem: View {
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var weatherService: WeatherService
    @EnvironmentObject private var locationFavoritesService: LocationFavoritesService

    let location: Location

    var body: some View {
        LocationItemContainer(action: onPressAction) {
            LocationItemIcon(name: "map.fill")
            LocationItemLabels(title: self.location.name, subtitle: self.location.regionName)
            Spacer()
            LocationItemStarButton(isHighlighted: self.isFavorite, onPressAction: self.toggleFavorite)
        }
    }

    private func onPressAction() {
        appState.toggleLocationPicker(animated: true)

        locationFavoritesService.saveActiveLocation(location: location)
        weatherService.setShouldFetchUpdatedWeather()
    }

    private var isFavorite: Bool {
        locationFavoritesService.favoriteLocations.contains(location)
    }

    private func toggleFavorite() {
        if locationFavoritesService.favoriteLocations.contains(location) {
            locationFavoritesService.favoriteLocations.removeAll { $0 == location }

            return
        }

        locationFavoritesService.favoriteLocations.append(location)
    }
}

struct SearchResultLocationItem_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultLocationItem(
            location: Location(
                name: "Ottawa",
                regionName: "ON, Canada",
                coordinate: .init(latitude: 0.0, longitude: 0.0)
            )
        )
    }
}
