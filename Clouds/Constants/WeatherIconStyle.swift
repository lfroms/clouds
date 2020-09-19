//
//  WeatherIconStyle.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-04-25.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CloudsAPI
import struct SwiftUI.Image

final class WeatherIconStyle {
    typealias Source = CloudsAPI.IconStyle

    private static let defaultIcon = SFSymbol.Forecast.sunny

    private static let dayStyle: [Source: String] = [
        .clear: SFSymbol.Forecast.sunny,
        .mainlyClear: SFSymbol.Forecast.partlySunny,
        .partlyCloudy: SFSymbol.Forecast.partlySunny,
        .mainlyCloudy: SFSymbol.Forecast.cloudy,
        .cloudy: SFSymbol.Forecast.cloudy,
        .rain: SFSymbol.Forecast.rainy,
        .fog: SFSymbol.Forecast.fog,
        .flurries: SFSymbol.Forecast.sleet,
        .hail: SFSymbol.Forecast.hail,
        .snow: SFSymbol.Forecast.snow,
        .driftingSnow: SFSymbol.Forecast.windSnow,
        .iceCrystals: SFSymbol.Forecast.sunny,
        .thunderstorm: SFSymbol.Forecast.thunderstorm,
        .windy: SFSymbol.Forecast.windy,
        .funnel: SFSymbol.Forecast.thunderstorm,
        .particulate: SFSymbol.Forecast.smoke
    ]

    private static let nightStyle: [Source: String] = [
        .clear: SFSymbol.Forecast.moon,
        .mainlyClear: SFSymbol.Forecast.moon,
        .partlyCloudy: SFSymbol.Forecast.cloudyNight,
        .mainlyCloudy: SFSymbol.Forecast.cloudyNight,
        .cloudy: SFSymbol.Forecast.cloudyNight,
        .rain: SFSymbol.Forecast.rainyNight,
        .fog: SFSymbol.Forecast.fog,
        .flurries: SFSymbol.Forecast.sleet,
        .hail: SFSymbol.Forecast.hail,
        .snow: SFSymbol.Forecast.snow,
        .driftingSnow: SFSymbol.Forecast.windSnow,
        .iceCrystals: SFSymbol.Forecast.moon,
        .thunderstorm: SFSymbol.Forecast.thunderstormNight,
        .windy: SFSymbol.Forecast.windy,
        .funnel: SFSymbol.Forecast.thunderstormNight,
        .particulate: SFSymbol.Forecast.smoke
    ]
}

extension WeatherIconStyle {
    static subscript(_ key: Source?, _ scheme: WeatherColorScheme.Source) -> String {
        guard let key = key else {
            return defaultIcon
        }

        if scheme == .night {
            return nightStyle[key, default: defaultIcon]
        }

        return dayStyle[key, default: defaultIcon]
    }
}
