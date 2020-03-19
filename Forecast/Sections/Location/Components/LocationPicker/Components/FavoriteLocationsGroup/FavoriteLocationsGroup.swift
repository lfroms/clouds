//
//  FavoriteLocationsGroup.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-14.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct FavoriteLocationsGroup: View {
    var locations: [StoredLocation]
    var locationsWeather: [ShortFormWeather]

    var onSelectLocation: (StoredLocation) -> Void
    var onDelete: (StoredLocation) -> Void

    var body: some View {
        LocationPickerListSection(
            label: "Favourite locations",
            loading: .constant(false)
        ) {
            if self.locations.isEmpty {
                Text("You haven't added any favourite locations.")
                    .foregroundColor(AppColor.Display.secondary)
                    .font(.caption)
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }

            ForEach(Array(self.locations.enumerated()), id: \.element) { index, favorite in
                LocationItem(
                    style: .favorite,
                    location: favorite,
                    weather: self.locationsWeather[safe: index],
                    action: self.onSelectLocation,
                    onStar: self.onDelete
                )
                .equatable()
                .transition(.fadeAndScale)
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
