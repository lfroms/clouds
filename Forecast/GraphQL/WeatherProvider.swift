//
//  NetworkManager.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Apollo
import Combine
import Foundation
import SwiftUI

class WeatherProvider: ObservableObject {
    @Published private(set) var activeLocation: WeatherQuery.Data.ActiveLocationWeather?
    @Published private(set) var currentLocation: WeatherQuery.Data.CurrentLocationWeather?
    @Published private(set) var favoriteLocations: [ShortFormWeather] = []
    
    @Published private(set) var error: Error?
    @Published private(set) var loading: Bool = false
    
    @ObservedObject private(set) var locationManager = LocationManager.shared
    private var anyCancellable: AnyCancellable?
    
    let objectDidReceiveUpdatedWeather = PassthroughSubject<Void, Never>()
    
    init() {
        NotificationCenter.default.addObserver(
            forName: UIApplication.willEnterForegroundNotification,
            object: nil,
            queue: nil,
            using: fetchFromNotification
        )
        
        anyCancellable = locationManager.objectWillChange.sink { _ in
            self.fetchData()
        }
    }
    
    private func fetchFromNotification(_ notification: Notification) {
        fetchData()
    }
    
    func fetchData() {
        loading = true
        
        let favoriteLocationsCoordinates = coordinatesOfFavoriteLocations()
        
        let query = WeatherQuery(
            currentLocation: coordinateForCurrentLocation(),
            activeLocation: coordinateForActiveLocation(),
            favoriteCoordinates: favoriteLocationsCoordinates,
            units: .metric,
            language: .e
        )
        
        apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheData) { result in
            self.loading = false
            
            guard let data = try? result.get().data else {
                return
            }
            
            self.activeLocation = data.activeLocationWeather
            self.currentLocation = data.currentLocationWeather
            self.favoriteLocations = self.mapBulkWeather(items: data.favoriteLocationWeather, coordinates: favoriteLocationsCoordinates)
            
            self.objectDidReceiveUpdatedWeather.send()
        }
    }
    
    func fetchDataWithDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.fetchData()
        }
    }
    
    private func coordinateForActiveLocation() -> Coordinate? {
        let locationToFetch: Location? = UserSettings.getActiveLocation()
        
        guard let savedActiveLocation = locationToFetch else {
            return coordinateForCurrentLocation()
        }
        
        return Coordinate(
            latitude: savedActiveLocation.coordinate.latitude,
            longitude: savedActiveLocation.coordinate.longitude
        )
    }
    
    private func coordinateForCurrentLocation() -> Coordinate? {
        guard let lastLocation = locationManager.lastLocation else {
            return nil
        }
        
        return Coordinate(
            latitude: lastLocation.coordinate.latitude,
            longitude: lastLocation.coordinate.longitude
        )
    }
    
    private func coordinatesOfFavoriteLocations() -> [Coordinate] {
        let locations = UserSettings.getFavoriteLocations()
        
        return locations.map { location -> Coordinate in
            Coordinate(
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude
            )
        }
    }
    
    private func mapBulkWeather(items: [WeatherQuery.Data.FavoriteLocationWeather?], coordinates: [Coordinate]) -> [ShortFormWeather] {
        return items.enumerated().compactMap { index, weather in
            guard let weather = weather else {
                return nil
            }
            
            return ShortFormWeather(
                coordinate: .init(
                    latitude: coordinates[index].latitude,
                    longitude: coordinates[index].longitude
                ),
                temperature: weather.currentConditions?.temperature,
                iconCode: weather.currentConditions?.iconCode
            )
        }
    }
}
