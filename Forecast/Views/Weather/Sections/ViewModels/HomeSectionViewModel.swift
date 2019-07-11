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
    
    var currentTemperature: Int {
        let currentConditions = weather?.currentConditions
        return Temperature.toPreferredUnitInt(currentConditions?.temperature?.value ?? "")
    }
    
    var observation: String {
        return weather?.currentConditions.condition ?? ""
    }
    
    var forecastHigh: Int? {
        let forecast = weather?.forecastGroup.forecast
        let todayForecast = forecast?.first(where: { $0.period.textForecastName == "Today" })
        let temperature = todayForecast?.temperatures.temperature.first?.value
        
        if let temperature = temperature {
            return Int(temperature)
        }
        
        return nil
    }
    
    var forecastLow: Int? {
        let forecast = weather?.forecastGroup.forecast
        let todayForecast = forecast?.first(where: { $0.period.textForecastName == "Tonight" })
        let temperature = todayForecast?.temperatures.temperature.first?.value
        
        if let temperature = temperature {
            return Int(temperature)
        }
        
        return nil
    }
    
    var dateStamp: Date {
        let date = weather?.currentConditions.dateTime?.timeStamp
        return date?.toDate("yyyyMMddHHmmss", region: .UTC)?.convertTo(region: .current).date ?? Date()
    }
    
    var stationName: String {
        return weather?.location.name.value ?? ""
    }
    
    var observations: [DetailBlockDescriptor] {
        guard let cc = weather?.currentConditions else {
            return []
        }
        
        var observations = [DetailBlockDescriptor]()
        
        // MARK: - Humidity 💧
        
        if let humidity = cc.relativeHumidity,
            let value = humidity.value,
            let units = humidity.units {
            let item = DetailBlockDescriptor(
                symbolName: "drop.triangle",
                value: value + units,
                label: "Humidity"
            )
            
            observations.append(item)
        }
        
        // MARK: - Atmospheric Pressure 📈
        
        if let pressure = cc.pressure,
            let value = pressure.value {
            let item = DetailBlockDescriptor(
                symbolName: "speedometer",
                value: "\(value) \(pressure.units)",
                label: "Pressure"
            )
            
            observations.append(item)
        }
        
        // MARK: - Wind Chill ❄️
        
        if let windChill = cc.windChill,
            let value = windChill.value {
            let item = DetailBlockDescriptor(
                symbolName: "thermometer.snowflake",
                value: createTemperatureValueFrom(value),
                label: "Wind Chill"
            )
            
            observations.append(item)
        }
        
        // MARK: - Humidex ☀️
        
        if let humidex = cc.humidex,
            let value = humidex.value {
            let item = DetailBlockDescriptor(
                symbolName: "thermometer.sun",
                value: createTemperatureValueFrom(value),
                label: "Humidex"
            )
            
            observations.append(item)
        }
        
        // MARK: - Wind 💨
        
        if let wind = cc.wind {
            if let speed = wind.speed.value {
                let item = DetailBlockDescriptor(
                    symbolName: "wind",
                    value: "\(speed) \(wind.speed.units)",
                    valuePrefix: wind.direction,
                    label: "Wind"
                )
                
                observations.append(item)
            }
            
            if let gust = wind.gust.value {
                let item = DetailBlockDescriptor(
                    symbolName: "arrow.right",
                    value: "\(gust) \(wind.gust.units)",
                    label: "Wind Gust"
                )
                
                observations.append(item)
            }
        }
        
        // MARK: - Visibility 📏
        
        if let visibility = cc.visibility,
            let value = visibility.value {
            let item = DetailBlockDescriptor(
                symbolName: "scope",
                value: "\(value) \(visibility.units)",
                label: "Visibility"
            )
            
            observations.append(item)
        }
        
        // MARK: - Dewpoint 🌡
        
        if let dewpoint = cc.dewpoint,
            let value = dewpoint.value {
            let item = DetailBlockDescriptor(
                symbolName: "thermometer",
                value: createTemperatureValueFrom(value),
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
