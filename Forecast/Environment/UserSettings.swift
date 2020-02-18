//
//  UserSettings.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-17.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation

final class UserSettings {
    private static let defaults = UserDefaults.standard
    
    // MARK: - Active Location
    
    private static let activeLocationKey: String = "active_location"
    
    static func getActiveLocation() -> Location? {
        if let activeLocation = defaults.object(forKey: activeLocationKey) as? Data {
            let decoder = JSONDecoder()
            let loadedPerson = try? decoder.decode(Location.self, from: activeLocation)
            
            return loadedPerson
        }
        
        return nil
    }
    
    static func saveActiveLocation(location: Location) {
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(location) {
            defaults.set(encoded, forKey: activeLocationKey)
        }
    }
    
    static func clearActiveLocation() {
        defaults.removeObject(forKey: activeLocationKey)
    }
    
    // MARK: - Favorite Locations
    
    private static let favoriteLocationsKey: String = "favorite_locations"
    
    static func getFavoriteLocations() -> [Location] {
        if let data = defaults.value(forKey: favoriteLocationsKey) as? Data {
            let locations = try? PropertyListDecoder().decode([Location].self, from: data)
            
            return locations ?? []
        }
        
        return []
    }
    
    static func saveFavoriteLocations(newLocations: [Location]) {
        defaults.set(try? PropertyListEncoder().encode(newLocations), forKey: favoriteLocationsKey)
    }
}
