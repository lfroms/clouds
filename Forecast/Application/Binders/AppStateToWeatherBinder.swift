//
//  AppStateToWeatherBinder.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-04.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Combine
import SwiftUI

struct AppStateToWeatherBinder: ViewModifier {
    private var appState: AppState
    private var weatherService: WeatherService

    private lazy var weatherCancellable: AnyCancellable? = nil
    private lazy var appStateCancellable: AnyCancellable? = nil

    init(appState: AppState, weatherService: WeatherService) {
        self.appState = appState
        self.weatherService = weatherService

        weatherCancellable = weatherService.didLoadUpdatedWeather.sink(receiveValue: setIconCodeToCurrentConditions)
        appStateCancellable = appState.activeSectionDidChange.sink(receiveValue: changeIconCodeBasedOnSection)
    }

    func body(content: Content) -> some View {
        content
    }

    // MARK: - Binding Functions

    private func setIconCodeToCurrentConditions() {
        appState.setIconCode(to: weatherService.activeLocation?.currentConditions?.iconCode, animated: true)
    }

    private func setIconCodeToFirstInDailyForecast() {
        appState.setIconCode(to: weatherService.activeLocation?.dailyForecast?.days?.first?.iconCode, animated: true)
    }

    private func changeIconCodeBasedOnSection() {
        switch appState.activeSection {
        case .now:
            setIconCodeToCurrentConditions()
        case .week:
            setIconCodeToFirstInDailyForecast()
        case .radar:
            break
        }
    }
}
