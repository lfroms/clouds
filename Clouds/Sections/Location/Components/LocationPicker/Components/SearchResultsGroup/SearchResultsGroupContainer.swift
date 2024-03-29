//
//  SearchResultsGroupContainer.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-14.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SearchResultsGroupContainer: Container {
    @EnvironmentObject private var locationSearchService: LocationSearchService
    @EnvironmentObject private var locationFavoritesService: LocationFavoritesService
    @EnvironmentObject private var locationPickerState: LocationPickerState

    var body: some View {
        SearchResultsGroup(
            label: headerText,
            value: locationSearchService.searchQuery,
            loading: .constant(false),
            results: results,
            favorites: favorites,
            onSelectLocation: didSelect(location:),
            onStarLocation: didStar(location:)
        )
        .equatable()
    }

    private var results: [RawLocation] {
        locationSearchService.results.compactMap {
            RawLocation(name: $0.title, regionName: $0.subtitle)
        }
    }

    private var headerText: String {
        let count = locationSearchService.results.count
        let pluralizedResults = count == 1 ? "result" : "results"

        return "\(count) \(pluralizedResults) for"
    }

    private var favorites: [Bool] {
        locationSearchService.results.map { result in
            locationFavoritesService.isFavorite(name: result.title, regionName: result.subtitle)
        }
    }

    private func didSelect(location: RawLocation) {
        locationFavoritesService.setActiveLocation(to: location) {
            self.locationPickerState.toggleLocationPicker(animated: true)
        }
    }

    private func didStar(location: RawLocation) {
        locationFavoritesService.toggleFavorite(location: location)
    }
}

struct SearchResultsGroupContainer_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsGroupContainer()
    }
}
