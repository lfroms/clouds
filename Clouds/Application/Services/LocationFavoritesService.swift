//
//  LocationFavoritesService.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-02-17.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Combine
import MapKit
import SwiftUI

final class LocationFavoritesService: ObservableObject {
    var activeLocation: StoredLocation? {
        getLocation(forKey: .activeLocation)
    }
    
    private(set) var favoriteLocations: [StoredLocation] {
        get {
            getLocations(forKey: .favoriteLocations)
        }
        
        set {
            objectWillChange.send()
            saveLocations(newValue, forKey: .favoriteLocations)
        }
    }
    
    // MARK: - Active Location
    
    public func setActiveLocation(to location: RawLocation, completion: @escaping () -> Void) {
        getCoordinatesFor(location: location) { coordinates in
            let storedLocation = self.createStoredLocation(from: location, with: coordinates)
            self.setActiveLocation(to: storedLocation)
            completion()
        }
    }
    
    public func setActiveLocation(to location: StoredLocation) {
        objectWillChange.send()
        saveLocation(location, forKey: .activeLocation)
    }
    
    public func clearActiveLocation() {
        objectWillChange.send()
        saveLocation(nil, forKey: .activeLocation)
    }
    
    public func clearFavoriteLocations() {
        favoriteLocations = []
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
    
    public func toggleFavorite(location: RawLocation) {
        getCoordinatesFor(location: location) { coordinates in
            let storedLocation = self.createStoredLocation(from: location, with: coordinates)
            self.toggleFavorite(location: storedLocation)
        }
    }
    
    public func toggleFavorite(location: StoredLocation) {
        guard !favoriteLocations.contains(location) else {
            removeFavorite(location: location)
            return
        }
        
        favoriteLocations.append(location)
    }
    
    public func removeFavorite(location: StoredLocation) {
        favoriteLocations.removeAll { $0 == location }
    }
    
    public func isFavorite(name: String, regionName: String) -> Bool {
        return favoriteLocations.contains { favoriteLocation in
            favoriteLocation.name == name && favoriteLocation.regionName == regionName
        }
    }
}

// MARK: - Storage in UserDefaults

extension LocationFavoritesService {
    private enum Key: String {
        case activeLocation = "active_location"
        case favoriteLocations = "favorite_locations"
    }
    
    private func getLocation(forKey key: Key) -> StoredLocation? {
        guard let activeLocation = UserDefaults.standard.object(forKey: key.rawValue) as? Data else {
            return nil
        }
        
        let decoder = JSONDecoder()
        let decodedLocation = try? decoder.decode(StoredLocation.self, from: activeLocation)
        
        return decodedLocation
    }
    
    private func saveLocation(_ location: StoredLocation?, forKey key: Key) {
        guard let location = location else {
            UserDefaults.standard.removeObject(forKey: key.rawValue)
            return
        }
        
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(location) {
            UserDefaults.standard.set(encoded, forKey: key.rawValue)
        }
    }
    
    private func getLocations(forKey key: Key) -> [StoredLocation] {
        guard let data = UserDefaults.standard.value(forKey: key.rawValue) as? Data else {
            return []
        }
        
        let locations = try? PropertyListDecoder().decode([StoredLocation].self, from: data)
        
        return locations ?? []
    }
    
    private func saveLocations(_ locations: [StoredLocation], forKey key: Key) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(locations), forKey: key.rawValue)
    }
}
