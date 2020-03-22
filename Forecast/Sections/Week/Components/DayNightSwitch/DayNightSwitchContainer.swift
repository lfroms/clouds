//
//  DayNightSwitchContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DayNightSwitchContainer: View {
    @EnvironmentObject private var weekSectionState: WeekSectionState
    @EnvironmentObject private var weatherService: WeatherService

    var body: some View {
        DayNightSwitch(isOn: $weekSectionState.showingNightConditions, hasDay: hasDay, hasNight: hasNight)
            .equatable()
    }

    private var hasDay: Bool {
        guard let currentDay = weatherService.activeLocation?.dailyForecast?.days?[safe: weekSectionState.dayIndex] else {
            return false
        }

        return currentDay.dayCondition != nil
    }

    private var hasNight: Bool {
        guard let currentDay = weatherService.activeLocation?.dailyForecast?.days?[safe: weekSectionState.dayIndex] else {
            return false
        }

        return currentDay.nightCondition != nil
    }
}

struct DayNightSwitchContainer_Previews: PreviewProvider {
    static var previews: some View {
        DayNightSwitchContainer()
    }
}
