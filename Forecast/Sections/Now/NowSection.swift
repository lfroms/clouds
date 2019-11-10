//
//  NowSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftDate
import SwiftUI

struct NowSection: View {
    @EnvironmentObject private var provider: WeatherProvider
    
    var body: some View {
        VStack(spacing: 32) {
            OverviewView(
                temperature: currentTemperature,
                observation: observation,
                highTemp: forecastHigh,
                lowTemp: forecastLow
            )
            .padding(.horizontal, 36)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 14) {
                    ForEach(items, id: \.id) { item in
                        HourlyForecastView(viewModel: item)
                    }
                }
                .padding(.horizontal, 26)
                .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
            }
            .frame(height: 140, alignment: .top)
        }
    }
    
    var currentTemperature: String {
        guard let temperature = provider.weather?.currentConditions?.temperature else {
            return "--"
        }
        
        return "\(Int(temperature.rounded() + 0.0))"
    }
    
    var observation: String {
        return provider.weather?.currentConditions?.summary ?? ""
    }
    
    var forecastHigh: Int? {
        guard let high = provider.weather?.todaySummary?.high else {
            return nil
        }
        
        return Int(high.rounded())
    }
    
    var forecastLow: Int? {
        guard let low = provider.weather?.todaySummary?.low else {
            return nil
        }
        
        return Int(low.rounded())
    }
    
    var dateStamp: Date {
        let parsedUnixTime = Double(provider.weather?.currentConditions?.time ?? 0)
        
        return Date(seconds: parsedUnixTime, region: .UTC)
            .convertTo(region: .current).date
    }
    
    var items: [HourlyForecastViewModel] {
        var hourlyForecastItems: [HourlyForecastViewModel] = []
        
        guard let weather = provider.weather else {
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

struct NowTab_Previews: PreviewProvider {
    static var previews: some View {
        NowSection()
    }
}
