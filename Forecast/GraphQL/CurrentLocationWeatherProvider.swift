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

class CurrentLocationWeatherProvider: ObservableObject {
    @Published private(set) var weather: CurrentLocationWeatherQuery.Data.WeatherByCoordinate?
    @Published private(set) var error: Error?
    @Published private(set) var loading: Bool = false
    
    @ObservedObject var locationManager: LocationManager = LocationManager.shared
    private var anyCancellable: AnyCancellable?
    
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
        guard let lastLocation = locationManager.lastLocation else {
            return
        }
        
        let query = CurrentLocationWeatherQuery(
            latitude: lastLocation.coordinate.latitude,
            longitude: lastLocation.coordinate.longitude,
            units: .metric,
            language: .e
        )
        
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
