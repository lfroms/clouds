//
//  HeaderAccessoriesContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-02.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HeaderAccessoriesContainer: View {
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var weather: WeatherProvider

    var body: some View {
        HeaderAccessories(
            hidden: appState.showingLocationPicker,
            sunriseSunset: sunriseSunset,
            observedAt: observedAt
        )
        .equatable()
    }

    private var sunriseSunset: SunriseSunset? {
        guard let sun = weather.activeLocation?.sun else {
            return nil
        }

        return SunriseSunset(sunriseTimestamp: sun.riseTime, sunsetTimestamp: sun.setTime)
    }

    private var observedAt: ObservedAt {
        ObservedAt(
            loading: weather.loading,
            timestamp: weather.activeLocation?.currentConditions?.time,
            action: weather.fetchData
        )
    }
}

struct HeaderAccessoriesContainer_Previews: PreviewProvider {
    static var previews: some View {
        HeaderAccessoriesContainer()
    }
}
