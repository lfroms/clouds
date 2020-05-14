//
//  Seeder.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-05-01.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation

final class Seeder {
    static let shared = Seeder()

    var locationFavoritesService = LocationFavoritesService()

    func eraseLocationFavorites() {
        locationFavoritesService.clearActiveLocation()
        locationFavoritesService.clearFavoriteLocations()
    }

    func seedLocationFavorites(setActive: Bool = false) {
        if setActive {
            locationFavoritesService.setActiveLocation(to:
                StoredLocation(
                    name: "Montréal",
                    regionName: "QC, Canada",
                    coordinate: .init(latitude: 45.5017, longitude: -73.5673)
                )
            )
        }

        locationFavoritesService.toggleFavorite(location: StoredLocation(
            name: "Montréal",
            regionName: "QC, Canada",
            coordinate: .init(latitude: 45.5017, longitude: -73.5673)
        ))

        locationFavoritesService.toggleFavorite(
            location: StoredLocation(
                name: "Toronto",
                regionName: "ON, Canada",
                coordinate: .init(latitude: 43.6532, longitude: -79.3832)
            )
        )

        locationFavoritesService.toggleFavorite(
            location: StoredLocation(
                name: "Vancouver",
                regionName: "BC, Canada",
                coordinate: .init(latitude: 49.2827, longitude: -123.1207)
            )
        )
    }
}
