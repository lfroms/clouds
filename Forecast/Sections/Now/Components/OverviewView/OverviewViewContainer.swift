//
//  OverviewViewContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-03.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OverviewViewContainer: View {
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
        guard let temperature = weatherService.activeLocation?.currentConditions?.temperature else {
            return "--"
        }
        
        return "\(Int(temperature.rounded() + 0.0))"
    }
    
    var observation: String {
        return weatherService.activeLocation?.currentConditions?.summary ?? ""
    }
    
    var forecastHigh: Int? {
        guard let high = weatherService.activeLocation?.todaySummary?.high else {
            return nil
        }
        
        return Int(high.rounded())
    }
    
    var forecastLow: Int? {
        guard let low = weatherService.activeLocation?.todaySummary?.low else {
            return nil
        }
        
        return Int(low.rounded())
    }
    
    var dateStamp: Date {
        let parsedUnixTime = Double(weatherService.activeLocation?.currentConditions?.time ?? 0)
        
        return Date(seconds: parsedUnixTime, region: .UTC)
            .convertTo(region: .current).date
    }
}

struct OverviewViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        OverviewViewContainer()
    }
}
