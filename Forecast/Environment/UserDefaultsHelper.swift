//
//  UserDefaultsHelper.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-17.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation

final class UserDefaultsHelper {
    private static let favoriteLocationsKey: String = "favorite_locations"

    static func getFavoriteLocations() -> [Location] {
        if let data = UserDefaults.standard.value(forKey: favoriteLocationsKey) as? Data {
            let locations = try? PropertyListDecoder().decode([Location].self, from: data)

            return locations ?? []
        }

        return []
    }

    static func saveFavoriteLocations(newLocations: [Location]) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(newLocations), forKey: favoriteLocationsKey)
    }
}
