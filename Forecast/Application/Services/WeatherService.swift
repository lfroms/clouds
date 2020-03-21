//
//  WeatherService.swift
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

class WeatherService: ObservableObject {
    @Published private(set) var activeLocation: WeatherQuery.Data.ActiveLocationWeather?
    @Published private(set) var currentLocation: WeatherQuery.Data.CurrentLocationWeather?
    @Published private(set) var currentLocationShortForm: ShortFormWeather?
    @Published private(set) var favoriteLocations: [ShortFormWeather] = []
    
    @Published private(set) var error: Error?
    @Published private(set) var loading: Bool = false
    
    let shouldLoadUpdatedWeather = PassthroughSubject<Void, Never>()
    let didLoadUpdatedWeather = PassthroughSubject<Void, Never>()
    
    private var currentRequest: Apollo.Cancellable?
    
    func setShouldFetchUpdatedWeather() {
        shouldLoadUpdatedWeather.send()
    }
    
    func fetchData(
        currentLocation: CLLocationCoordinate2D?,
        activeLocation: CLLocationCoordinate2D?,
        favoriteLocations: [CLLocationCoordinate2D]
    ) {
        if loading {
            currentRequest?.cancel()
        } else {
            loading = true
        }
        
        let activeLocation = activeLocation?.asGraphQLCoordinate ?? currentLocation?.asGraphQLCoordinate
        
        let query = WeatherQuery(
            currentLocation: currentLocation?.asGraphQLCoordinate,
            activeLocation: activeLocation,
            favoriteCoordinates: favoriteLocations.asGraphQLCoordinates,
            units: .metric,
            language: .e
        )
        
        currentRequest = GraphQL.shared.apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    self.loading = false
                    
                    self.activeLocation = data.activeLocationWeather
                    self.currentLocation = data.currentLocationWeather
                    self.currentLocationShortForm = self.mapCurrentLocationWeather(coordinate: currentLocation)
                    self.favoriteLocations = self.mapBulkWeather(items: data.favoriteLocationWeather, coordinates: favoriteLocations.asGraphQLCoordinates)
                    
                    self.didLoadUpdatedWeather.send()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func mapCurrentLocationWeather(coordinate: CLLocationCoordinate2D?) -> ShortFormWeather? {
        guard let coordinate = coordinate else {
            return nil
        }
        
        return ShortFormWeather(
            coordinate: coordinate,
            temperature: currentLocation?.currentConditions?.temperature,
            iconCode: currentLocation?.currentConditions?.iconCode
        )
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
