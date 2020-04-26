//
//  HeaderAccessoriesContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-02.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HeaderAccessoriesContainer: Container {
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var locationPickerState: LocationPickerState
    @EnvironmentObject private var weatherService: WeatherService

    var body: some View {
        HeaderAccessories(
            sunriseSunset: sunriseSunset,
            sunriseSunsetHidden: sunriseSunsetHidden,
            observedAt: observedAt
        )
        .equatable()
        .opacity(hidden ? 0 : 1)
    }

    private var hidden: Bool {
        locationPickerState.presented || appState.activeSection == .radar
    }

    private var sunriseSunsetHidden: Bool {
        [.week, .radar].contains(appState.activeSection)
    }

    private var sunriseSunset: SunriseSunsetData? {
        guard let sunriseTime = weatherService.weather?.today.sunriseTime, let sunsetTime = weatherService.weather?.today.sunsetTime else {
            return nil
        }

        return SunriseSunsetData(sunrise: sunriseTime, sunset: sunsetTime)
    }

    private var observedAt: ObservedAtData {
        ObservedAtData(
            loading: weatherService.loading,
            timestamp: weatherService.weather?.currently.time,
            action: weatherService.setShouldFetchUpdatedWeather
        )
    }
}

struct HeaderAccessoriesContainer_Previews: PreviewProvider {
    static var previews: some View {
        HeaderAccessoriesContainer()
    }
}
