//
//  DayPickerContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-21.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftDate
import SwiftUI

struct DayPickerContainer: Container {
    @EnvironmentObject private var weatherService: WeatherService
    @EnvironmentObject private var weekSectionState: WeekSectionState

    var body: some View {
        DayPicker(days: days, activeIndex: $weekSectionState.dayIndex)
            .equatable()
    }

    private var days: [DailyForecastData] {
        guard let days = weatherService.activeLocation?.dailyForecast?.days else {
            return []
        }

        return days.compactMap { day in
            let date = Date(seconds: Double(day.time), region: .UTC)
                .convertTo(region: .current).date

            return DailyForecastData(date: date, dayCondition: nil, nightCondition: nil)
        }
    }
}

struct DayPickerContainer_Previews: PreviewProvider {
    static var previews: some View {
        DayPickerContainer()
    }
}
