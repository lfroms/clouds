//
//  HourlyForecastSectionViewModel.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Foundation
import SwiftDate

struct HourlyForecastSectionViewModel {
    let weather: WeatherQuery.Data.Weather?
    
    var items: [HourlyForecastViewModel] {
        let hourlyForecastEntries = weather?.hourlyForecastGroup?.hourlyForecast
        
        var hourlyForecastItems: [HourlyForecastViewModel] = []
        
        hourlyForecastEntries?.forEach(
            { item in
                
                let forecastItem = HourlyForecastViewModel(
                    date: getDateFrom(string: item.dateTimeUtc),
                    symbolName: ForecastIcon.forCode(item.iconCode.value ?? "00"),
                    temperature: Temperature.toPreferredUnitInt(item.temperature.value),
                    temperatureUnits: Temperature.currentUnit(),
                    windSpeedUnits: item.wind.speed.units,
                    windSpeed: parseStringAsOptionalInt(item.wind.speed.value),
                    pop: parseStringAsOptionalInt(item.lop.value)
                )
                
                hourlyForecastItems.append(forecastItem)
            }
        )
        
        return hourlyForecastItems
    }
    
    private func getDateFrom(string: String) -> DateInRegion {
        return string.toDate("yyyyMMddHHmm", region: .UTC)?.convertTo(region: .current) ?? DateInRegion()
    }
    
    private func parseStringAsOptionalInt(_ value: String?) -> Int? {
        guard let value = value, !value.isEmpty, let asInt = Int(value) else {
            return nil
        }
        
        return asInt
    }
}
