//
//  AppColor.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-14.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation
import SwiftUI

public final class AppColor {
    public final class Display {
        public static let primary = Color.white
        public static let secondary = primary.opacity(0.7)
        public static let secondaryBright = primary.opacity(0.8)
        public static let placeholder = primary.opacity(0.3)
    }

    public final class Control {
        public static let subdued = Color.white.opacity(0.4)
        public static let extraSubdued = Color.white.opacity(0.15)
        public static let viewBackground = Color.black
    }

    public final class Weather {
        typealias ColorScheme = (upper: ColorSet, lower: ColorSet)

        internal enum ColorSet: String {
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
        }

        private static let blueSky = ColorScheme(upper: .clearSkyLightBlue, lower: .clearSkyBlue)

        static let dryCloud = ColorScheme(upper: .dryCloudLightGray, lower: .dryCloudGray)
        static let empty = ColorScheme(upper: .emptyLightGray, lower: .emptyGray)

        private static let wetCloud = ColorScheme(upper: .wetCloudLightGray, lower: .wetCloudGray)
        private static let storm = ColorScheme(upper: .stormLightGray, lower: .stormGray)
        private static let night = ColorScheme(upper: .nightSkyIndigo, lower: .nightSkyDeepIndigo)
        private static let particulate = ColorScheme(upper: .particulateLightBeige, lower: .particulateBeige)
        private static let waterSpout = ColorScheme(upper: .liquidLightBlueGray, lower: .liquidBlueGray)

        internal typealias CodeMap = [Int: ColorScheme]

        static let schemes: CodeMap = [
            0: blueSky,
            1: blueSky,
            2: blueSky,
            3: blueSky,
            4: blueSky,

            6: dryCloud,
            7: dryCloud,
            8: dryCloud,
            9: wetCloud,
            10: dryCloud,

            11: wetCloud,
            12: wetCloud,
            13: wetCloud,
            14: wetCloud,
            15: wetCloud,

            16: dryCloud,
            17: dryCloud,

            18: wetCloud,

            19: storm,

            23: dryCloud,
            24: dryCloud,
            25: dryCloud,
            26: dryCloud,
            27: dryCloud,
            28: dryCloud,

            30: night,
            31: night,
            32: night,
            33: night,
            34: night,
            35: night,
            36: night,
            37: night,
            38: night,
            39: night,

            40: dryCloud,
            41: storm,
            42: storm,
            43: dryCloud,
            44: particulate,
            45: particulate,
            46: storm,
            47: particulate,
            48: waterSpout
        ]
    }
}

extension AppColor.Weather.CodeMap {
    subscript(code key: Int) -> AppColor.Weather.ColorScheme {
        self[key, default: AppColor.Weather.dryCloud]
    }
}
