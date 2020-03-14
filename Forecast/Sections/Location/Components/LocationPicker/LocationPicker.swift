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
    var favoriteLocations: [Location]
    var searchQuery: String
    var searchResults: [Location]

    var body: some View {
        let pluralizedResults = searchResults.count == 1 ? "result" : "results"
        let label = "\(searchResults.count) \(pluralizedResults) for"

        return VStack(alignment: .leading, spacing: Dimension.LocationPicker.sectionSpacing) {
            if searchQuery.isEmpty {
                if currentLocation != nil {
                    LocationPickerListSection(label: "Current location", loading: $loading) {
                        CurrentLocationItem(icon: SFSymbol.locationFilled, location: self.currentLocation!)
                    }
                }

                if favoriteLocations.count > 0 {
                    LocationPickerListSection(label: "Favourite locations", loading: $loading) {
                        ForEach(self.favoriteLocations, id: \.id) { location in
                            FavoriteLocationItem(location: location)
                        }
                    }
                }
            } else {
                LocationPickerListSection(label: label, value: searchQuery, loading: $loading) {
                    ForEach(self.searchResults, id: \.id) { location in
                        SearchResultLocationItem(location: location)
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
            searchResults: []
        )
    }
}
