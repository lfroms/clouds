//
//  LocationPicker.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationPicker: View {
    @Binding var loading: Bool
    var currentLocation: Location?
    var currentLocationWeather: ShortFormWeather?
    var favoriteLocations: [Location]
    var favoriteLocationsWeather: [ShortFormWeather]?
    var searchQuery: String
    var searchResults: [Location]

    var onSelectCurrentLocation: (Location) -> Void
    var onSelectFavoriteLocation: (Location) -> Void
    var onSelectSearchResult: (Location) -> Void
    var onStar: (Location) -> Void

    var body: some View {
        let pluralizedResults = searchResults.count == 1 ? "result" : "results"
        let label = "\(searchResults.count) \(pluralizedResults) for"

        return VStack(alignment: HorizontalAlignment.leading, spacing: Dimension.LocationPicker.sectionSpacing) {
            if searchQuery.isEmpty {
                if currentLocation != nil {
                    LocationPickerListSection(label: "Current location", loading: $loading) {
                        LocationItem(
                            style: .current,
                            location: self.currentLocation!,
                            weather: self.currentLocationWeather,
                            action: self.onSelectCurrentLocation
                        )
                    }
                }

                if favoriteLocations.count > 0 {
                    LocationPickerListSection(label: "Favourite locations", loading: $loading) {
                        ForEach(Array(self.favoriteLocations.enumerated()), id: \.element.id) { index, favoriteLocation in
                            LocationItem(
                                style: .favorite,
                                location: favoriteLocation,
                                weather: self.favoriteLocationsWeather?[safe: index],
                                action: self.onSelectFavoriteLocation,
                                onStar: self.onStar
                            )
                        }
                    }
                }
            } else {
                LocationPickerListSection(label: label, value: searchQuery, loading: $loading) {
                    ForEach(self.searchResults, id: \.id) { location in
                        LocationItem(
                            style: .search,
                            location: location,
                            action: self.onSelectSearchResult,
                            onStar: self.onStar
                        )
                    }
                }
            }
        }
        .padding(.vertical, Dimension.Global.padding / 2)
        .padding(.horizontal, Dimension.Global.padding)
    }
}

extension LocationPicker: Equatable {
    static func == (lhs: LocationPicker, rhs: LocationPicker) -> Bool {
        lhs.loading == rhs.loading
            && lhs.currentLocation == rhs.currentLocation
            && lhs.favoriteLocations == rhs.favoriteLocations
            && lhs.searchQuery == rhs.searchQuery
            && lhs.searchResults == rhs.searchResults
    }
}

struct LocationPicker_Previews: PreviewProvider {
    static var previews: some View {
        LocationPicker(
            loading: .constant(false),
            currentLocation: nil,
            favoriteLocations: [],
            searchQuery: .empty,
            searchResults: [],
            onSelectCurrentLocation: { _ in },
            onSelectFavoriteLocation: { _ in },
            onSelectSearchResult: { _ in },
            onStar: { _ in }
        )
    }
}
