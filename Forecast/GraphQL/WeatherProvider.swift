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

class WeatherProvider: ObservableObject {
    @Published private(set) var weather: WeatherQuery.Data.Weather?
    @Published private(set) var favoriteLocationsWeather: [FavoriteLocationWeather] = []
    @Published private(set) var error: Error?
    @Published private(set) var loading: Bool = false
    
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
        fetchFavoritesData()
    }
    
    func fetchData() {
        let mainQuery = WeatherQuery(province: .on, siteCode: 430, units: .metric, language: .e)
        
        loading = true
        
        apollo.fetch(query: mainQuery, cachePolicy: .fetchIgnoringCacheData) { result in
            guard let data = try? result.get().data else {
                return
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.loading = false
            }
            
            self.weather = data.weather
        }
    }
    
    func fetchFavoritesData() {
        let favoriteLocations = UserDefaultsHelper.getFavoriteLocations()
        let favoriteLocationsCoordinates = getCoordinatesFromFavoriteLocations(locations: favoriteLocations)
        let bulkQuery = FavoriteLocationsWeatherQuery(coordinates: favoriteLocationsCoordinates, units: .metric, language: .e)
        
        loading = true
        
        apollo.fetch(query: bulkQuery, cachePolicy: .fetchIgnoringCacheData) { result in
            guard let data = try? result.get().data else {
                return
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.loading = false
            }
            
            self.favoriteLocationsWeather = data.bulkWeatherByCoordinates.enumerated().compactMap { index, weather in
                guard let weather = weather else {
                    return nil
                }
                
                return FavoriteLocationWeather(
                    coordinate: .init(
                        latitude: favoriteLocationsCoordinates[index].latitude!!,
                        longitude: favoriteLocationsCoordinates[index].longitude!!
                    ),
                    temperature: weather.currentConditions?.temperature,
                    iconCode: weather.currentConditions?.iconCode
                )
            }
        }
    }
    
    private func getCoordinatesFromFavoriteLocations(locations: [Location]) -> [Coordinate] {
        return locations.map { location -> Coordinate in
            Coordinate(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        }
    }
}

// TODO: Clean this up
struct FavoriteLocationWeather {
    let coordinate: CLLocationCoordinate2D
    let temperature: Double?
    let iconCode: Int?
}
