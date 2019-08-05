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
    @Published private(set) var weather: WeatherQuery.Data.Weather? = nil
    @Published private(set) var error: Error? = nil
    
    init() {
        fetchData()
    }
    
    private func fetchData() {
        let query = WeatherQuery(province: .on, siteCode: 430, units: .metric, language: .e)
        
        apollo.fetch(query: query) { result in
            guard let data = try? result.get().data else {
                return
            }
            
            self.weather = data.weather
        }
    }
}
