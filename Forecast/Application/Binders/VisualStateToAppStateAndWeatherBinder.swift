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
    private var appState: AppState
    private var weekSectionState: WeekSectionState
    private var visualState: VisualState
    private var weatherService: WeatherService

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
        visualState.setIconCode(to: weatherService.activeLocation?.currentConditions?.iconCode, animated: true)
    }

    private func setIconCodeToDailyForecast() {
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

    private func changeIconCodeBasedOnSection() {
        switch appState.activeSection {
        case .now:
            setIconCodeToCurrentConditions()
            visualState.shrinkBackground = false

        case .week:
            setIconCodeToDailyForecast()
            visualState.shrinkBackground = true

        case .radar:
            visualState.shrinkBackground = false
        }
    }
}
