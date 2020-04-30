//
//  ConditionLayoutContainer.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ConditionLayoutContainer: Container {
    @EnvironmentObject private var weatherService: WeatherService
    @EnvironmentObject private var weekSectionState: WeekSectionState

    var body: some View {
        Group {
            if data != nil {
                ConditionLayout(data: data!)
                    .equatable()
            }
        }
    }

    var data: DailyForecastData.Condition? {
        guard
            let days = weatherService.weather?.daily,
            let day = days[safe: weekSectionState.dayIndex]
        else {
            return nil
        }

        var parsedDayCondition: DailyForecastData.Condition?
        var parsedNightCondition: DailyForecastData.Condition?

        if let dayCondition = day.daytimeConditions {
            parsedDayCondition = DailyForecastData.Condition(
                description: dayCondition.summaryClouds,
                summary: dayCondition.summary,
                colorScheme: dayCondition.icon.colorScheme,
                temperature: dayCondition.temperature,
                windSpeed: dayCondition.wind.speed,
                pop: (dayCondition.precipProbability != nil) ? Int(dayCondition.precipProbability! * 100) : nil
            )
        }

        if let nightCondition = day.nighttimeConditions {
            parsedNightCondition = DailyForecastData.Condition(
                description: nightCondition.summaryClouds,
                summary: nightCondition.summary,
                colorScheme: nightCondition.icon.colorScheme,
                temperature: nightCondition.temperature,
                windSpeed: nightCondition.wind.speed,
                pop: (nightCondition.precipProbability != nil) ? Int(nightCondition.precipProbability! * 100) : nil
            )
        }

        if parsedDayCondition == nil, parsedNightCondition != nil {
            return parsedNightCondition
        }

        if parsedNightCondition == nil, parsedDayCondition != nil {
            return parsedDayCondition
        }

        if weekSectionState.showingNightConditions {
            return parsedNightCondition
        } else {
            return parsedDayCondition
        }
    }
}

struct ConditionLayoutContainer_Previews: PreviewProvider {
    static var previews: some View {
        ConditionLayoutContainer()
    }
}
