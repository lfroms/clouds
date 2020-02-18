//
//  UserPreferences.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-03-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Foundation

class UserPreferences {
    enum DefaultKeys: String {
        case tempUnits
    }

    enum TemperatureUnit: String {
        case c = "C"
        case f = "F"
    }

    static func preferredTemperature() -> TemperatureUnit {
        guard self.defaultTemperatureExists() else {
            return .c
        }

        let storedValue = UserDefaults.standard.string(forKey: DefaultKeys.tempUnits.rawValue)

        return TemperatureUnit(rawValue: storedValue!) ?? .c
    }

    private static func defaultTemperatureExists() -> Bool {
        return UserDefaults.standard.string(forKey: DefaultKeys.tempUnits.rawValue) != nil
    }
}
