//
//  HourlyForecastContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-03.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftDate
import SwiftUI

struct HourlyForecastContainer: View {
    @EnvironmentObject private var weatherService: WeatherService
    
    var body: some View {
        HourlyForecast(items: items)
    }
    
    var items: [HourlyForecastViewModel] {
        var hourlyForecastItems: [HourlyForecastViewModel] = []
        
        guard let weather = weatherService.activeLocation else {
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
}

struct HourlyForecastContainer_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastContainer()
    }
}
