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
    
    private enum Keys: String {
        case activeLocationKey = "active_location"
        case favoriteLocationsKey = "favorite_locations"
    }
    
    // MARK: - Active Location
    
    static func getActiveLocation() -> Location? {
        if let activeLocation = defaults.object(forKey: Keys.activeLocationKey.rawValue) as? Data {
            let decoder = JSONDecoder()
            let decodedLocation = try? decoder.decode(Location.self, from: activeLocation)
            
            return decodedLocation
        }
        
        return nil
    }
    
    static func saveActiveLocation(location: Location) {
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(location) {
            defaults.set(encoded, forKey: Keys.activeLocationKey.rawValue)
        }
    }
    
    static func clearActiveLocation() {
        defaults.removeObject(forKey: Keys.activeLocationKey.rawValue)
    }
    
    // MARK: - Favorite Locations
    
    static func getFavoriteLocations() -> [Location] {
        if let data = defaults.value(forKey: Keys.favoriteLocationsKey.rawValue) as? Data {
            let locations = try? PropertyListDecoder().decode([Location].self, from: data)
            
            return locations ?? []
        }
        
        return []
    }
    
    static func saveFavoriteLocations(newLocations: [Location]) {
        defaults.set(try? PropertyListEncoder().encode(newLocations), forKey: Keys.favoriteLocationsKey.rawValue)
    }
}
