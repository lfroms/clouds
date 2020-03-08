//
//  LocationFavoritesService.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-17.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Combine
import SwiftUI

final class LocationFavoritesService: ObservableObject {
    @Published var favoriteLocations: [Location] = getFavoriteLocations() {
        didSet {
            saveFavoriteLocations(newLocations: favoriteLocations)
        }
    }
    
    let didFinishUpdatingFavorites = PassthroughSubject<Void, Never>()
    
    func triggerFinishedUpdatingFavorites() {
        didFinishUpdatingFavorites.send()
    }
    
    private enum Keys: String {
        case activeLocationKey = "active_location"
        case favoriteLocationsKey = "favorite_locations"
    }
    
    // MARK: - Active Location
    
    func getActiveLocation() -> Location? {
        if let activeLocation = UserDefaults.standard.object(forKey: Keys.activeLocationKey.rawValue) as? Data {
            let decoder = JSONDecoder()
            let decodedLocation = try? decoder.decode(Location.self, from: activeLocation)
            
            return decodedLocation
        }
        
        return nil
    }
    
    func saveActiveLocation(location: Location) {
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(location) {
            UserDefaults.standard.set(encoded, forKey: Keys.activeLocationKey.rawValue)
        }
    }
    
    func clearActiveLocation() {
        UserDefaults.standard.removeObject(forKey: Keys.activeLocationKey.rawValue)
    }
    
    // MARK: - Favorite Locations
    
    func getFavoriteLocations() -> [Location] {
        return Self.getFavoriteLocations()
    }
    
    private static func getFavoriteLocations() -> [Location] {
        if let data = UserDefaults.standard.value(forKey: Keys.favoriteLocationsKey.rawValue) as? Data {
            let locations = try? PropertyListDecoder().decode([Location].self, from: data)
            
            return locations ?? []
        }
        
        return []
    }
    
    func saveFavoriteLocations(newLocations: [Location]) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(newLocations), forKey: Keys.favoriteLocationsKey.rawValue)
    }
}
