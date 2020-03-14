//
//  FavoriteLocationsGroup.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-14.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct FavoriteLocationsGroup: View {
    var locations: [Location]
    var locationsWeather: [ShortFormWeather]

    var onSelectLocation: (Location) -> Void
    var onDelete: (Location) -> Void

    var body: some View {
        LocationPickerListSection(
            label: "Favourite locations",
            loading: .constant(false)
        ) {
            ForEach(Array(self.locations.enumerated()), id: \.element.id) { index, favorite in
                LocationItem(
                    style: .favorite,
                    location: favorite,
                    weather: self.locationsWeather[safe: index],
                    action: self.onSelectLocation,
                    onStar: self.onDelete
                )
                .equatable()
            }
        }
    }
}

extension FavoriteLocationsGroup: Equatable {
    static func == (lhs: FavoriteLocationsGroup, rhs: FavoriteLocationsGroup) -> Bool {
        lhs.locations == rhs.locations && lhs.locationsWeather == rhs.locationsWeather
    }
}

struct FavoriteLocationsGroup_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteLocationsGroup(
            locations: [],
            locationsWeather: [],
            onSelectLocation: { _ in },
            onDelete: { _ in }
        )
    }
}
