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
    
    var observations: [DetailBlockDescriptor] {
        guard let units = weather?.units, let cc = weather?.currentConditions else {
            return []
        }
        
        var observations = [DetailBlockDescriptor]()
        
        // MARK: - Humidity 💧
        
        if let humidity = cc.humidity {
            let item = DetailBlockDescriptor(
                symbolName: "drop.triangle",
                value: "\(humidity)%",
                label: "Humidity"
            )
            
            observations.append(item)
        }
        
        // MARK: - Atmospheric Pressure 📈
        
        if let pressure = cc.pressure {
            let item = DetailBlockDescriptor(
                symbolName: "gauge",
                value: "\(pressure) \(units.pressure)",
                label: "Pressure"
            )
            
            observations.append(item)
        }
        
        // MARK: - Wind Chill ❄️
        
        if let windChill = cc.windChill {
            let item = DetailBlockDescriptor(
                symbolName: "thermometer.snowflake",
                value: "\(windChill) °\(units.temperature)",
                label: "Wind Chill"
            )
            
            observations.append(item)
        }
        
        // MARK: - Humidex ☀️
        
        if let humidex = cc.humidex {
            let item = DetailBlockDescriptor(
                symbolName: "thermometer.sun",
                value: "\(humidex) °\(units.temperature)",
                label: "Humidex"
            )
            
            observations.append(item)
        }
        
        // MARK: - Wind 💨
        
        if let wind = cc.wind {
            let item = DetailBlockDescriptor(
                symbolName: "wind",
                value: "\(wind.speed) \(units.speed)",
                valuePrefix: wind.direction,
                label: "Wind"
            )
            
            observations.append(item)
        }
        
        if let gust = cc.wind?.gust {
            let item = DetailBlockDescriptor(
                symbolName: "arrow.right",
                value: "\(gust) \(units.speed)",
                label: "Wind Gust"
            )
            
            observations.append(item)
        }
        
        // MARK: - Visibility 📏
        
        if let visibility = cc.visibility {
            let item = DetailBlockDescriptor(
                symbolName: "scope",
                value: "\(visibility) \(units.distance)",
                label: "Visibility"
            )
            
            observations.append(item)
        }
        
        // MARK: - Dewpoint 🌡
        
        if let dewPoint = cc.dewPoint {
            let item = DetailBlockDescriptor(
                symbolName: "thermometer",
                value: "\(dewPoint) °\(units.temperature)",
                label: "Dewpoint"
            )
            
            observations.append(item)
        }
        
        return observations
    }
    
    private func createTemperatureValueFrom(_ value: String) -> String {
        let parsedValue = Temperature.toPreferredUnitFloat(value)
        let parsedUnits = Temperature.currentUnit(symbol: true)
        
        return "\(parsedValue)" + parsedUnits
    }
}
