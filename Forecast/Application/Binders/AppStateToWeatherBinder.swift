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

    init(appState: AppState, weatherService: WeatherService) {
        self.appState = appState
        self.weatherService = weatherService

        weatherCancellable = weatherService.didLoadUpdatedWeather.sink(receiveValue: updateIconCode)
    }

    func body(content: Content) -> some View {
        content
    }

    // MARK: - Binding Functions

    private func updateIconCode() {
        appState.setIconCode(to: weatherService.activeLocation?.currentConditions?.iconCode, animated: true)
    }
}
