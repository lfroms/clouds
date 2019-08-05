//
//  HourlyForecastSectionViewModel.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Foundation
import SwiftDate

struct HourlyForecastSectionViewModel: Identifiable {
    var id = UUID()
    
    let weather: WeatherQuery.Data.Weather?
    
    var items: [HourlyForecastViewModel] {
        var hourlyForecastItems: [HourlyForecastViewModel] = []
        
        guard let weather = weather else {
            return []
        }
        
        weather.hourlyForecast?.hours?.forEach(
            { item in
                
                let forecastItem = HourlyForecastViewModel(
                    date: getDateFrom(item.time),
                    symbolName: ForecastIcon.forCode(item.iconCode),
                    temperature: Int(item.temperature),
                    temperatureUnits: weather.units.temperature,
                    windSpeedUnits: weather.units.speed,
                    windSpeed: item.wind?.speed,
                    pop: item.precipProbability
                )
                
                hourlyForecastItems.append(forecastItem)
            }
        )
        
        return hourlyForecastItems
    }
    
    private func getDateFrom(_ timeStamp: Int) -> DateInRegion {
        return Date(seconds: TimeInterval(timeStamp), region: .UTC)
            .convertTo(region: .current)
    }
    
    private func parseStringAsOptionalInt(_ value: String?) -> Int? {
        guard let value = value, !value.isEmpty, let asInt = Int(value) else {
            return nil
        }
        
        return asInt
    }
}
