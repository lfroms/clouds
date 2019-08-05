//
//  DailyForecastSectionViewModel.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Foundation
import SwiftDate

struct DailyForecastSectionViewModel: Identifiable {
    var id = UUID()
    
    let weather: WeatherQuery.Data.Weather?
    
    var items: [DailyForecastItem] {
        guard let weather = weather, let forecastEntries = weather.dailyForecast?.days else {
            return []
        }
        
        var dailyForecastItems: [DailyForecastItem] = []
        
        for item in forecastEntries {
            let forecastItem = DailyForecastItem(
                title: item.when,
                description: item.shortSummary,
                temperature: Int(item.temperature),
                temperatureUnits: weather.units.temperature,
                symbolName: ForecastIcon.forCode(item.iconCode),
                pop: item.precipProbability
            )
            
            dailyForecastItems.append(forecastItem)
        }
        
        return dailyForecastItems
    }
    
    private func parseStringAsOptionalInt(_ value: String?) -> Int? {
        guard let value = value, !value.isEmpty, let asInt = Int(value) else {
            return nil
        }
        
        return asInt
    }
}
