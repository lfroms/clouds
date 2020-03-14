//
//  SearchResultsGroupContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-14.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SearchResultsGroupContainer: View {
    @EnvironmentObject private var locationSearchService: LocationSearchService
    @EnvironmentObject private var locationFavoritesService: LocationFavoritesService
    @EnvironmentObject private var locationPickerState: LocationPickerState
    @EnvironmentObject private var weatherService: WeatherService

    var body: some View {
        SearchResultsGroup(
            label: headerText,
            value: locationSearchService.searchQuery,
            loading: .constant(locationSearchService.loading),
            results: locationSearchService.results,
            favorites: favorites,
            onSelectLocation: didSelect(location:),
            onStarLocation: didStar(location:)
        )
        .equatable()
    }

    private var headerText: String {
        let count = locationSearchService.results.count
        let pluralizedResults = count == 1 ? "result" : "results"

        return "\(count) \(pluralizedResults) for"
    }

    private var favorites: [Bool] {
        locationSearchService.results.map { result in
            locationFavoritesService.favoriteLocations.contains(result)
        }
    }

    private func didSelect(location: Location) {
        locationPickerState.toggleLocationPicker(animated: true)

        locationFavoritesService.saveActiveLocation(location: location)
        weatherService.setShouldFetchUpdatedWeather()
    }

    private func didStar(location: Location) {
        if locationFavoritesService.favoriteLocations.contains(location) {
            locationFavoritesService.favoriteLocations.removeAll { $0 == location }

            return
        }

        locationFavoritesService.favoriteLocations.append(location)
    }
}

struct SearchResultsGroupContainer_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsGroupContainer()
    }
}
