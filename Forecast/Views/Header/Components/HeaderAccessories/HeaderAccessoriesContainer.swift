//
//  HeaderAccessoriesContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-02.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HeaderAccessoriesContainer: Container {
    @EnvironmentObject private var locationPickerState: LocationPickerState
    @EnvironmentObject private var weatherService: WeatherService

    var body: some View {
        HeaderAccessories(
            hidden: locationPickerState.presented,
            sunriseSunset: sunriseSunset,
            observedAt: observedAt
        )
        .equatable()
    }

    private var sunriseSunset: SunriseSunsetData? {
        guard let sun = weatherService.activeLocation?.sun else {
            return nil
        }

        return SunriseSunsetData(sunrise: sun.riseTime, sunset: sun.setTime)
    }

    private var observedAt: ObservedAtData {
        ObservedAtData(
            loading: weatherService.loading,
            timestamp: weatherService.activeLocation?.currentConditions?.time,
            action: weatherService.setShouldFetchUpdatedWeather
        )
    }
}

struct HeaderAccessoriesContainer_Previews: PreviewProvider {
    static var previews: some View {
        HeaderAccessoriesContainer()
    }
}
