//
//  ForecastIcon.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2018-12-24.
//  Copyright © 2018 Lukas Romsicki. All rights reserved.
//

import Foundation

class ForecastIcon {
    private enum AvailableIcon: String {
        case sunny = "sun.max.fill"
        case partlySunny = "cloud.sun.fill"
        case rainy = "cloud.rain.fill"
        case heavyRain = "cloud.heavyrain.fill"
        case drizzle = "cloud.drizzle.fill"
        case sleet = "cloud.sleet.fill"
        case haze = "sun.haze.fill"
        case fog = "cloud.fog.fill"
        case hail = "cloud.hail.fill"
        case thunderstorm = "cloud.bolt.rain.fill"
        case cloudy = "cloud.fill"
        case snow = "cloud.snow.fill"
        case moon = "moon.fill"
        case cloudyNight = "cloud.moon.fill"
        case rainyNight = "cloud.moon.rain.fill"
        case thunderstormNight = "cloud.moon.bolt.fill"
        case windy = "wind"
        case windSnow = "wind.snow"
        case smoke
    }

    static func forCode(_ code: String) -> String {
        guard let codeInt = Int(code), let iconName = icon[codeInt]?.rawValue else {
            return AvailableIcon.sunny.rawValue
        }

        return iconName
    }

    private static let icon: [Int: AvailableIcon] = [
        0: .sunny,
        1: .sunny,
        2: .partlySunny,
        3: .partlySunny,
        4: .partlySunny,
        5: .sunny,
        6: .drizzle,
        7: .sleet,
        8: .sleet,
        9: .thunderstorm,
        10: .cloudy,
        12: .rainy,
        13: .rainy,
        14: .sleet,
        15: .sleet,
        16: .snow,
        17: .snow,
        18: .snow,
        19: .thunderstorm,
        22: .partlySunny,
        23: .haze,
        24: .fog,
        27: .hail,
        28: .drizzle,
        29: .sunny,
        30: .moon,
        31: .cloudyNight,
        32: .cloudyNight,
        33: .cloudy,
        34: .cloudy,
        35: .moon,
        36: .rainyNight,
        37: .rainyNight,
        38: .snow,
        39: .thunderstormNight,
        40: .snow,
        43: .windy,
        44: .smoke
    ]
}
