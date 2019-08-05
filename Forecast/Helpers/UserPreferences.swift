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
        case siteCode = "defaultSiteCode"
        case provinceCode = "defaultProvinceCode"
        case tempUnits
    }

    enum TemperatureUnit: String {
        case c = "C"
        case f = "F"
    }

    struct SavedSite {
        var code: Int
        var region: Province
    }

    static func defaultSite() -> SavedSite? {
        guard self.defaultSiteExists() else {
            return nil
        }

        let siteCode = UserDefaults.standard.integer(forKey: DefaultKeys.siteCode.rawValue)
        let provinceCode = UserDefaults.standard.string(forKey: DefaultKeys.provinceCode.rawValue)
        let province = Province(rawValue: provinceCode!)

        guard province != nil else {
            return nil
        }

        return SavedSite(code: siteCode, region: province!)
    }

    private static func defaultSiteExists() -> Bool {
        return
            UserDefaults.standard.integer(forKey: DefaultKeys.siteCode.rawValue) != 0 &&
            UserDefaults.standard.string(forKey: DefaultKeys.provinceCode.rawValue) != nil
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
