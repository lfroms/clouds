//
//  HourlyForecastContainer.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-03.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HourlyForecastContainer: Container {
    @EnvironmentObject private var weatherService: WeatherService

    var body: some View {
        HourlyForecast(items: items)
            .equatable()
            .overlay(weatherService.weather?.currently.temperature != nil && items.isEmpty ? hourlyForecastUnavailable : nil, alignment: .center)
    }

    private var items: [HourlyForecastItemData] {
        guard
            let activeLocation = weatherService.weather
        else {
            return []
        }

        return activeLocation.hourly.compactMap { hour in
            HourlyForecastItemData(
                date: Date(seconds: hour.time).convertTo(region: .current),
                symbolName: WeatherIconStyle[hour.icon.style, hour.icon.colorScheme],
                temperature: Int(hour.temperature ?? 0),
                temperatureUnits: "C",
                windSpeedUnits: "km/h",
                windSpeed: hour.wind.speed,
                pop: Int((hour.precipProbability ?? 0) * 100)
            )
        }
    }

    private var hourlyForecastUnavailable: some View {
        Text("Hourly Forecast Unavailable")
            .font(.subheadline)
            .fontWeight(.bold)
            .foregroundColor(Color.white.opacity(0.6))
    }
}

struct HourlyForecastContainer_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastContainer()
    }
}
