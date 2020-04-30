//
//  VisualStateToWeekSectionStateAndWeatherBinder.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-04.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Combine
import SwiftUI

struct VisualStateToWeekSectionStateAndWeatherBinder: ViewModifier {
    private let weekSectionState: WeekSectionState
    private let visualState: VisualState
    private let weatherService: WeatherService
    private let appState: AppState

    private lazy var weekStateCancellable: AnyCancellable? = nil

    init(weekSectionState: WeekSectionState, visualState: VisualState, weatherService: WeatherService, appState: AppState) {
        self.weekSectionState = weekSectionState
        self.visualState = visualState
        self.weatherService = weatherService
        self.appState = appState

        weekStateCancellable = weekSectionState.objectWillChange
            .receive(on: RunLoop.main)
            .sink(receiveValue: setIconCodeToWeekSectionActiveDay)
    }

    func body(content: Content) -> some View {
        content
    }

    // MARK: - Binding Functions

    private func setIconCodeToWeekSectionActiveDay() {
        guard appState.activeSection == .week else {
            return
        }

        let index = weekSectionState.dayIndex
        let days = weatherService.weather?.daily

        let day = days?[safe: index]

        if day?.daytimeConditions == nil, day?.nighttimeConditions != nil {
            visualState.set(style: day?.nighttimeConditions?.icon.style, colorScheme: day?.nighttimeConditions?.icon.colorScheme, animated: true)
            return
        }

        if day?.nighttimeConditions == nil, day?.daytimeConditions != nil {
            visualState.set(style: day?.daytimeConditions?.icon.style, colorScheme: day?.daytimeConditions?.icon.colorScheme, animated: true)
            return
        }

        let style = weekSectionState.showingNightConditions ? day?.nighttimeConditions?.icon.style : day?.daytimeConditions?.icon.style
        let colorScheme = weekSectionState.showingNightConditions ? day?.nighttimeConditions?.icon.colorScheme : day?.daytimeConditions?.icon.colorScheme

        visualState.set(style: style, colorScheme: colorScheme, animated: true)
    }
}
