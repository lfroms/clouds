//
//  ConditionLayoutContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ConditionLayoutContainer: View {
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
            let days = weatherService.activeLocation?.dailyForecast?.days,
            let day = days[safe: weekSectionState.dayIndex]
        else {
            return nil
        }

        var parsedDayCondition: DailyForecastData.Condition?
        var parsedNightCondition: DailyForecastData.Condition?

        if let dayCondition = day.dayCondition {
            parsedDayCondition = DailyForecastData.Condition(
                description: dayCondition.summary,
                summary: dayCondition.shortSummary,
                iconCode: dayCondition.iconCode,
                temperature: dayCondition.temperature,
                windSpeed: dayCondition.winds.first?.speed,
                pop: dayCondition.precipProbability
            )
        }

        if let nightCondition = day.nightCondition {
            parsedNightCondition = DailyForecastData.Condition(
                description: nightCondition.summary,
                summary: nightCondition.shortSummary,
                iconCode: nightCondition.iconCode,
                temperature: nightCondition.temperature,
                windSpeed: nightCondition.winds.first?.speed,
                pop: nightCondition.precipProbability
            )
        }

        if !weekSectionState.showingNightConditions, parsedDayCondition == nil {
            return parsedNightCondition
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
