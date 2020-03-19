//
//  LocationFavoritesService.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-17.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Combine
import MapKit
import SwiftUI

final class LocationFavoritesService: ObservableObject {
    @Published private(set) var favoriteLocations: [StoredLocation] = getFavoriteLocations() {
        didSet {
            saveFavoriteLocations(newLocations: favoriteLocations)
        }
    }
    
    private enum Keys: String {
        case activeLocationKey = "active_location"
        case favoriteLocationsKey = "favorite_locations"
    }
    
    // MARK: - Active Location
    
    func getActiveLocation() -> StoredLocation? {
        if let activeLocation = UserDefaults.standard.object(forKey: Keys.activeLocationKey.rawValue) as? Data {
            let decoder = JSONDecoder()
            let decodedLocation = try? decoder.decode(StoredLocation.self, from: activeLocation)
            
            return decodedLocation
        }
        
        return nil
    }
    
    func saveActiveLocation(location: RawLocation, completion: @escaping () -> Void) {
        getCoordinatesFor(location: location) { coordinates in
            let storedLocation = self.createStoredLocation(from: location, with: coordinates)
            self.saveActiveLocation(location: storedLocation)
            completion()
        }
    }
    
    func saveActiveLocation(location: StoredLocation) {
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(location) {
            UserDefaults.standard.set(encoded, forKey: Keys.activeLocationKey.rawValue)
        }
    }
    
    func clearActiveLocation() {
        UserDefaults.standard.removeObject(forKey: Keys.activeLocationKey.rawValue)
    }
    
    // MARK: - RawLocation Coordinate Lookup
    
    private func getCoordinatesFor(location: RawLocation, completion: @escaping (CLLocationCoordinate2D) -> Void) {
        let query = [location.name, location.regionName].joined(separator: ", ")
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        
        let search = MKLocalSearch(request: request)
        search.start { response, _ in
            guard let coordinate = response?.mapItems.first?.placemark.coordinate else {
                return
            }
            
            completion(coordinate)
        }
    }
    
    private func createStoredLocation(from rawLocation: RawLocation, with coordinates: CLLocationCoordinate2D) -> StoredLocation {
        StoredLocation(name: rawLocation.name, regionName: rawLocation.regionName, coordinate: coordinates)
    }
    
    // MARK: - Favorite Management
    
    func toggleFavorite(location: RawLocation) {
        getCoordinatesFor(location: location) { coordinates in
            let storedLocation = self.createStoredLocation(from: location, with: coordinates)
            self.toggleFavorite(location: storedLocation)
        }
    }
    
    func toggleFavorite(location: StoredLocation) {
        guard !favoriteLocations.contains(location) else {
            removeFavorite(location: location)
            return
        }
        
        favoriteLocations.append(location)
    }
    
    func removeFavorite(location: StoredLocation) {
        favoriteLocations.removeAll { $0 == location }
    }
    
    private static func getFavoriteLocations() -> [StoredLocation] {
        if let data = UserDefaults.standard.value(forKey: Keys.favoriteLocationsKey.rawValue) as? Data {
            let locations = try? PropertyListDecoder().decode([StoredLocation].self, from: data)
            
            return locations ?? []
        }
        
        return []
    }
    
    func getFavoriteLocations() -> [StoredLocation] {
        Self.getFavoriteLocations()
    }
    
    func saveFavoriteLocations(newLocations: [StoredLocation]) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(newLocations), forKey: Keys.favoriteLocationsKey.rawValue)
    }
    
    func isFavorite(name: String, regionName: String) -> Bool {
        return favoriteLocations.contains { favoriteLocation in
            favoriteLocation.name == name && favoriteLocation.regionName == regionName
        }
    }
}
