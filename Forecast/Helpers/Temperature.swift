//
//  Temperature.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-03-24.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Foundation

class Temperature {
    static func toPreferredUnitInt(_ value: String?) -> Int {
        
        return Int(toPreferredUnitFloat(value).rounded() + 0.0)
    }
    
    static func toPreferredUnitFloat(_ value: String?) -> Float {
        guard let parsedValue = Float(value ?? "") else {
            return 0.0
        }
        
        return toPreferredUnit(parsedValue)
    }
    
    static func currentUnit(symbol: Bool = false) -> String {
        return (symbol ? "°" : "") + UserPreferences.preferredTemperature().rawValue
    }
    
    private static func toPreferredUnit(_ value: Float) -> Float {
        if UserPreferences.preferredTemperature() == .f {
            let fahrenheit = value * 9 / 5 + 32
            return round(fahrenheit * 10) / 10
        }
        
        return value
    }
}
