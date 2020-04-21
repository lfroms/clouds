//
//  VisualStateToAppStateAndWeatherBinder.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-04.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Combine
import SwiftUI

struct VisualStateToAppStateAndWeatherBinder: ViewModifier {
    private let appState: AppState
    private let weekSectionState: WeekSectionState
    private let visualState: VisualState
    private let weatherService: WeatherService

    private lazy var weatherCancellable: AnyCancellable? = nil
    private lazy var appStateCancellable: AnyCancellable? = nil

    init(appState: AppState, weekSectionState: WeekSectionState, visualState: VisualState, weatherService: WeatherService) {
        self.appState = appState
        self.weekSectionState = weekSectionState
        self.visualState = visualState
        self.weatherService = weatherService

        weatherCancellable = weatherService.didLoadUpdatedWeather
            .receive(on: RunLoop.main)
            .debounce(for: .seconds(0.2), scheduler: RunLoop.main)
            .sink(receiveValue: changeIconCodeBasedOnSection)

        appStateCancellable = appState.activeSectionDidChange
            .receive(on: RunLoop.main)
            .sink(receiveValue: changeIconCodeBasedOnSection)
    }

    func body(content: Content) -> some View {
        content
    }

    // MARK: - Binding Functions

    private func setIconCodeToCurrentConditions() {
        visualState.setIconCode(to: weatherService.activeLocation?.currently.icon, animated: true)
    }

    private func setIconCodeToDailyForecast() {
        let index = weekSectionState.dayIndex
        let days = weatherService.activeLocation?.daily

        let day = days?[safe: index]

        if day?.daytimeConditions == nil, day?.nighttimeConditions != nil {
            visualState.setIconCode(to: day?.nighttimeConditions?.icon, animated: true)
            return
        }

        if day?.nighttimeConditions == nil, day?.daytimeConditions != nil {
            visualState.setIconCode(to: day?.daytimeConditions?.icon, animated: true)
            return
        }

        let icon = weekSectionState.showingNightConditions ? day?.nighttimeConditions?.icon : day?.daytimeConditions?.icon

        visualState.setIconCode(to: icon, animated: true)
    }

    private func changeIconCodeBasedOnSection() {
        if appState.activeSection != .week {
            resetWeekSection()
        }

        switch appState.activeSection {
        case .now:
            setIconCodeToCurrentConditions()

        case .week:
            setIconCodeToDailyForecast()

        case .radar:
            break
        }
    }

    private func resetWeekSection() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.weekSectionState.dayIndex = 0
            self.weekSectionState.showingNightConditions = false
        }
    }
}
