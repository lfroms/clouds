//
//  WeatherColorScheme.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-04-25.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import struct SwiftUI.Color

enum WeatherColorScheme: String {
    typealias Source = ColorScheme

    case clearSkyBlue = "blue_sky"
    case clearSkyLightBlue = "blue_sky_light"

    case dryCloudGray = "gray_cloud_dry"
    case dryCloudLightGray = "gray_cloud_dry_light"

    case wetCloudGray = "gray_cloud_wet"
    case wetCloudLightGray = "gray_cloud_wet_light"

    case stormGray = "gray_storm"
    case stormLightGray = "gray_storm_light"

    case nightSkyIndigo = "indigo_sky_night"
    case nightSkyDeepIndigo = "indigo_sky_deep_night"

    case particulateBeige = "beige_particulate"
    case particulateLightBeige = "beige_particulate_light"

    case liquidBlueGray = "gray_blue_liquid"
    case liquidLightBlueGray = "gray_blue_liquid_light"

    case emptyGray = "gray_empty"
    case emptyLightGray = "gray_empty_light"

    var color: Color {
        Color(self.rawValue)
    }

    internal typealias ColorSet = (upper: Color, lower: Color)

    internal static let empty = (upper: emptyLightGray.color, lower: emptyGray.color)

    private static let schemes: [Source: ColorSet] = [
        .clearSky: (upper: clearSkyLightBlue.color, lower: clearSkyBlue.color),
        .dryCloud: (upper: dryCloudLightGray.color, lower: dryCloudGray.color),
        .wetCloud: (upper: wetCloudLightGray.color, lower: wetCloudGray.color),
        .storm: (upper: stormLightGray.color, lower: stormGray.color),
        .night: (upper: nightSkyIndigo.color, lower: nightSkyDeepIndigo.color),
        .particulate: (upper: particulateLightBeige.color, lower: particulateBeige.color),
        .liquid: (upper: liquidLightBlueGray.color, lower: liquidBlueGray.color),
        .empty: empty
    ]
}

extension WeatherColorScheme {
    static subscript(_ key: Source?) -> ColorSet {
        guard let key = key else {
            return empty
        }

        return Self.schemes[key, default: empty]
    }
}
