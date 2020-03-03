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
            sunriseTimestamp: weather.activeLocation?.sun?.riseTime,
            sunsetTimestamp: weather.activeLocation?.sun?.setTime,
            observedAtTimestamp: weather.activeLocation?.currentConditions?.time,
            loading: weather.loading,
            observedAtAction: weather.fetchData
        )
        .equatable()
    }
}

struct HeaderAccessoriesContainer_Previews: PreviewProvider {
    static var previews: some View {
        HeaderAccessoriesContainer()
    }
}
