//
//  NetworkManager.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Apollo
import Combine
import CoreLocation
import Foundation
import SwiftUI

class FavoritesWeatherProvider: ObservableObject {
    @Published private(set) var favoriteLocationsWeather: [FavoriteLocationWeather] = []
    @Published private(set) var error: Error?
    @Published private(set) var loading: Bool = false
    
    private typealias ReturnedWeatherEntry = FavoriteLocationsWeatherQuery.Data.BulkWeatherByCoordinate?
    
    init() {
        NotificationCenter.default.addObserver(
            forName: UIApplication.willEnterForegroundNotification,
            object: nil,
            queue: nil,
            using: fetchFromNotification
        )
    }
    
    private func fetchFromNotification(_ notification: Notification) {
        fetchData()
    }
    
    func fetchData() {
        let locations = UserDefaultsHelper.getFavoriteLocations()
        let coordinates = getCoordinatesFromFavoriteLocations(locations: locations)
        
        // TODO: - Should adjust to the user's preference.
        let bulkQuery = FavoriteLocationsWeatherQuery(coordinates: coordinates, units: .metric, language: .e)
        
        loading = true
        
        apollo.fetch(query: bulkQuery, cachePolicy: .fetchIgnoringCacheData) { result in
            guard let data = try? result.get().data else {
                return
            }
            
            self.loading = false
            self.favoriteLocationsWeather = self.mapBulkWeather(items: data.bulkWeatherByCoordinates, coordinates: coordinates)
        }
    }
    
    private func mapBulkWeather(items: [ReturnedWeatherEntry], coordinates: [Coordinate]) -> [FavoriteLocationWeather] {
        return items.enumerated().compactMap { index, weather in
            guard let weather = weather else {
                return nil
            }
            
            return FavoriteLocationWeather(
                coordinate: .init(
                    latitude: coordinates[index].latitude!!,
                    longitude: coordinates[index].longitude!!
                ),
                temperature: weather.currentConditions?.temperature,
                iconCode: weather.currentConditions?.iconCode
            )
        }
    }
    
    private func getCoordinatesFromFavoriteLocations(locations: [Location]) -> [Coordinate] {
        return locations.map { location -> Coordinate in
            Coordinate(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        }
    }
}
