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

class WeatherProvider: BindableObject {
    var didChange = PassthroughSubject<WeatherProvider, Never>()
    
    var weather: WeatherQuery.Data.Weather? {
        didSet {
            didChange.send(self)
        }
    }
    
    var error: Error? {
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        fetchData()
    }
    
    private func fetchData() {
        let query = WeatherQuery(region: .on, code: 430)
        
        apollo.fetch(query: query) { result, error in
            self.error = error
            
            guard let result = result else {
                return
            }
            
            self.weather = result.data?.weather
        }
    }
}
