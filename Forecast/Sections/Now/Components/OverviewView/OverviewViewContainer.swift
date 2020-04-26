//
//  OverviewViewContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-03.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OverviewViewContainer: Container {
    @EnvironmentObject private var weatherService: WeatherService
    
    var body: some View {
        OverviewView(
            temperature: currentTemperature,
            observation: observation,
            highTemp: forecastHigh,
            lowTemp: forecastLow
        )
        .equatable()
    }
    
    var currentTemperature: String {
        guard let temperature = weatherService.weather?.currently.temperature else {
            return "--"
        }
        
        return "\(Int(temperature.rounded() + 0.0))"
    }
    
    var observation: String {
        return weatherService.weather?.currently.summary ?? ""
    }
    
    var forecastHigh: Int? {
        guard let high = weatherService.weather?.today.highTemperature else {
            return nil
        }
        
        return Int(high.rounded())
    }
    
    var forecastLow: Int? {
        guard let low = weatherService.weather?.today.lowTemperature else {
            return nil
        }
        
        return Int(low.rounded())
    }
}

struct OverviewViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        OverviewViewContainer()
    }
}
