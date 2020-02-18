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
    @Published private(set) var weather: WeatherQuery.Data.WeatherByCoordinate?
    @Published private(set) var error: Error?
    @Published private(set) var loading: Bool = false
    
    @Published var locationManager: LocationManager = LocationManager()
    
    private var locationToFetch: Location? = UserSettings.getActiveLocation()
    
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
        var variableQuery: WeatherQuery?
        
        if let lastLocation = locationManager.lastLocation {
            variableQuery = WeatherQuery(
                latitude: lastLocation.coordinate.latitude,
                longitude: lastLocation.coordinate.longitude,
                units: .metric,
                language: .e
            )
            
        } else {
            guard let locationToFetch = locationToFetch else {
                return
            }
            
            variableQuery = WeatherQuery(
                latitude: locationToFetch.coordinate.latitude,
                longitude: locationToFetch.coordinate.longitude,
                units: .metric,
                language: .e
            )
        }
        
        guard let query = variableQuery else {
            return
        }
        
        loading = true
        
        apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheData) { result in
            guard let data = try? result.get().data else {
                return
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.loading = false
            }
            
            self.weather = data.weatherByCoordinate
        }
    }
}
