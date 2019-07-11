//
//  DailyForecastSectionViewModel.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Foundation
import SwiftDate

struct DailyForecastSectionViewModel {
    let weather: WeatherQuery.Data.Weather?
    
    var items: [DailyForecastItem] {
        guard let forecastEntries = weather?.forecastGroup.forecast else {
            return []
        }
        
        var dailyForecastItems: [DailyForecastItem] = []
        
        for item in forecastEntries {
            let temperature = item.temperatures.temperature.first?.value ?? ""
            
            let forecastItem = DailyForecastItem(
                title: item.period.textForecastName,
                description: item.abbreviatedForecast.textSummary ?? "",
                temperature: Temperature.toPreferredUnitInt(temperature),
                temperatureUnits: Temperature.currentUnit(),
                symbolName: ForecastIcon.forCode(item.abbreviatedForecast.iconCode?.value ?? "00"),
                pop: parseStringAsOptionalInt(item.abbreviatedForecast.pop?.value)
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
