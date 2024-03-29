//
//  HeaderAccessoriesContainer.swift
//  Clouds
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
            loading: weatherService.loading
        )
        .equatable()
        .opacity(hidden ? 0 : 1)
        .animation(.easeInOut(duration: 0.2), value: appState.drawerIsOpen)
    }

    private var hidden: Bool {
        locationPickerState.presented
            || appState.activeSection == .radar
            || appState.drawerIsOpen
    }

    private var sunriseSunsetHidden: Bool {
        [.week, .radar].contains(appState.activeSection)
    }

    private var sunriseSunset: SunriseSunsetData? {
        guard
            let sunriseTime = weatherService.weather?.today.sunriseTime,
            let sunsetTime = weatherService.weather?.today.sunsetTime
        else {
            return nil
        }

        return SunriseSunsetData(sunrise: sunriseTime, sunset: sunsetTime)
    }
}

struct HeaderAccessoriesContainer_Previews: PreviewProvider {
    static var previews: some View {
        HeaderAccessoriesContainer()
    }
}
