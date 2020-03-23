//
//  VisualStateToWeekSectionStateAndWeatherBinder.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-04.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Combine
import SwiftUI

struct VisualStateToWeekSectionStateAndWeatherBinder: ViewModifier {
    private var weekSectionState: WeekSectionState
    private var visualState: VisualState
    private var weatherService: WeatherService

    private lazy var weekStateCancellable: AnyCancellable? = nil

    init(weekSectionState: WeekSectionState, visualState: VisualState, weatherService: WeatherService) {
        self.weekSectionState = weekSectionState
        self.visualState = visualState
        self.weatherService = weatherService

        weekStateCancellable = weekSectionState.objectWillChange
            .receive(on: RunLoop.main)
            .sink(receiveValue: setIconCodeToWeekSectionActiveDay)
    }

    func body(content: Content) -> some View {
        content
    }

    // MARK: - Binding Functions

    private func setIconCodeToWeekSectionActiveDay() {
        let index = weekSectionState.dayIndex
        let days = weatherService.activeLocation?.dailyForecast?.days

        let day = days?[safe: index]

        if day?.dayCondition == nil, day?.nightCondition != nil {
            visualState.setIconCode(to: day?.nightCondition?.iconCode, animated: true)
            return
        }

        if day?.nightCondition == nil, day?.dayCondition != nil {
            visualState.setIconCode(to: day?.dayCondition?.iconCode, animated: true)
            return
        }

        let iconCode = weekSectionState.showingNightConditions ? day?.nightCondition?.iconCode : day?.dayCondition?.iconCode

        visualState.setIconCode(to: iconCode, animated: true)
    }
}
