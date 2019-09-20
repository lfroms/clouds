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
    @Published private(set) var weather: WeatherQuery.Data.Weather?
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
    }
    
    private func fetchData() {
        let query = WeatherQuery(province: .on, siteCode: 430, units: .metric, language: .e)
        
        loading = true
        
        apollo.fetch(query: query, cachePolicy: .returnCacheDataAndFetch) { result in
            self.loading = false
            
            guard let data = try? result.get().data else {
                return
            }
            
            self.weather = data.weather
        }
    }
}
