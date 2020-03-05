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
            .equatable()
    }

    private var items: [HourlyForecastViewModel] {
        guard let activeLocation = weatherService.activeLocation else {
            return []
        }

        return activeLocation.hourlyForecast?.hours?.compactMap {
            HourlyForecastViewModel(
                date: DateHelper.inUTCTime(time: $0.time).convertTo(region: .current),
                symbolName: ForecastIcon.forCode($0.iconCode),
                temperature: Int($0.temperature),
                temperatureUnits: activeLocation.units.temperature,
                windSpeedUnits: activeLocation.units.speed,
                windSpeed: $0.wind?.speed,
                pop: $0.precipProbability
            )
        } ?? []
    }
}

struct HourlyForecastContainer_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastContainer()
    }
}
