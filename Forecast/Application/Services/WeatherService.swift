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
    @Published private(set) var weather: WeatherQuery.Data.Weather?
    @Published private(set) var loading: Bool = false
    
    let shouldLoadUpdatedWeather = PassthroughSubject<Void, Never>()
    let didLoadUpdatedWeather = PassthroughSubject<Void, Never>()
    
    func setShouldFetchUpdatedWeather() {
        shouldLoadUpdatedWeather.send()
    }
    
    private var request: Apollo.Cancellable?
    
    func fetch(selectedLocation: CLLocationCoordinate2D?, userLocation: CLLocationCoordinate2D?) {
        var weatherQuery: WeatherQuery?
        
        if let selectedLocation = selectedLocation {
            weatherQuery = WeatherQuery(latitude: selectedLocation.latitude, longitude: selectedLocation.longitude)
        } else if let userLocation = userLocation {
            weatherQuery = WeatherQuery(latitude: userLocation.latitude, longitude: userLocation.longitude)
        }
        
        guard let query = weatherQuery else {
            return
        }
        
        if loading {
            request?.cancel()
        } else {
            loading = true
        }
        
        request = GraphQL.shared.apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely) { result in
            self.loading = false
            
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    self.weather = data.weather
                    self.didLoadUpdatedWeather.send()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
