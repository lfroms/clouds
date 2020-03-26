//
//  HourlyForecastContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-03.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftDate
import SwiftUI

struct HourlyForecastContainer: Container {
    @EnvironmentObject private var weatherService: WeatherService

    var body: some View {
        HourlyForecast(items: items)
            .equatable()
    }

    private var items: [HourlyForecastItemData] {
        guard
            let activeLocation = weatherService.activeLocation
        else {
            return []
        }

        return activeLocation.hourly.compactMap { (hour) -> HourlyForecastItemData in
            HourlyForecastItemData(
                date: DateHelper.inUTCTime(time: hour.time).convertTo(region: .current),
                symbolName: ForecastIcon.forCode(hour.icon ?? 0),
                temperature: Int(hour.temperature ?? 0),
                temperatureUnits: "C",
                windSpeedUnits: "km/h",
                windSpeed: hour.wind.speed,
                pop: Int((hour.precipProbability ?? 0) * 100)
            )
        }
    }
}

struct HourlyForecastContainer_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastContainer()
    }
}
