//
//  WeatherImageStyle.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-04-25.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CloudsAPI
import struct SwiftUI.Image

enum WeatherImageStyle: String {
    typealias Source = CloudsAPI.IconStyle

    case clear
    case clearNight = "clear_night"

    case mainlyClear = "mainly_clear"
    case mainlyClearNight = "mainly_clear_night"

    case partlyCloudy = "partly_cloudy"
    case partlyCloudyNight = "partly_cloudy_night"

    case mostlyCloudy = "mostly_cloudy"
    case mostlyCloudyNight = "mostly_cloudy_night"

    case cloudy

    case rain
    case fog
    case flurries
    case hail
    case snow
    case driftingSnow = "drifting_snow"
    case iceCrystals = "ice_crystals"

    case storm
    case windy
    case funnel

    case particulate

    var image: Image {
        Image(self.rawValue)
    }

    private static let dayStyle: [Source: Self] = [
        .clear: clear,
        .mainlyClear: mainlyClear,
        .partlyCloudy: partlyCloudy,
        .mainlyCloudy: mostlyCloudy,
        .cloudy: cloudy,
        .rain: rain,
        .fog: fog,
        .flurries: flurries,
        .hail: hail,
        .snow: snow,
        .driftingSnow: driftingSnow,
        .iceCrystals: iceCrystals,
        .thunderstorm: storm,
        .windy: windy,
        .funnel: funnel,
        .particulate: particulate
    ]

    private static let nightStyle: [Source: Self] = [
        .clear: clearNight,
        .mainlyClear: mainlyClearNight,
        .partlyCloudy: partlyCloudyNight,
        .mainlyCloudy: mostlyCloudyNight,
        .cloudy: cloudy,
        .rain: rain,
        .fog: fog,
        .flurries: flurries,
        .hail: hail,
        .snow: snow,
        .driftingSnow: driftingSnow,
        .iceCrystals: iceCrystals,
        .thunderstorm: storm,
        .windy: windy,
        .funnel: funnel,
        .particulate: particulate
    ]
}

extension WeatherImageStyle {
    static subscript(_ key: Source?, _ scheme: WeatherColorScheme.Source) -> Image? {
        guard let key = key else {
            return nil
        }

        if scheme == .night {
            return nightStyle[key]?.image
        }

        return dayStyle[key]?.image
    }
}
