//
//  DailyForecastContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-07.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DailyForecastContainer: View {
    @EnvironmentObject private var weatherService: WeatherService
    @EnvironmentObject private var weekSectionState: WeekSectionState

    var body: some View {
        DailyForecast(days: days, activeIndex: $weekSectionState.dayIndex)
            .equatable()
    }

    private var days: [DailyForecastItemData] {
        guard let days = weatherService.activeLocation?.dailyForecast?.days else {
            return []
        }

        return days.compactMap { day in
            DailyForecastItemData(
                when: day.when,
                iconCode: day.iconCode,
                temperature: day.temperature,
                description: day.summary,
                windSpeed: day.winds.first?.speed,
                pop: day.precipProbability
            )
        }
    }
}

struct DailyForecastContainer_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastContainer()
    }
}
