//
//  HomeSectionViewModel.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Foundation

struct HomeSectionViewModel {
    let weather: WeatherQuery.Data.Weather?
    
    var currentTemperature: String {
        guard let temperature = weather?.currentConditions?.temperature else {
            return "--"
        }
        
        return "\(Int(temperature.rounded() + 0.0))"
    }
    
    var observation: String {
        return weather?.currentConditions?.summary ?? ""
    }
    
    var forecastHigh: Int? {
        guard let high = weather?.todaySummary?.high else {
            return nil
        }
        
        return Int(high.rounded())
    }
    
    var forecastLow: Int? {
        guard let low = weather?.todaySummary?.low else {
            return nil
        }
        
        return Int(low.rounded())
    }
    
    var dateStamp: Date {
        let parsedUnixTime = Double(weather?.currentConditions?.time ?? 0)
        
        return Date(seconds: parsedUnixTime, region: .UTC)
            .convertTo(region: .current).date
    }
    
    var stationName: String {
        return weather?.location.weatherFor ?? ""
    }
    
    private func createTemperatureValueFrom(_ value: String) -> String {
        let parsedValue = Temperature.toPreferredUnitFloat(value)
        let parsedUnits = Temperature.currentUnit(symbol: true)
        
        return "\(parsedValue)" + parsedUnits
    }
}
