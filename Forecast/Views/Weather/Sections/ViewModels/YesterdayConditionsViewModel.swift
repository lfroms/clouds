//
//  YesterdayConditionsViewModel.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-11.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Foundation

struct YesterdayConditionsViewModel {
    let weather: WeatherQuery.Data.Weather?
    
    var items: [IconDetailDescriptor] {
        guard let yesterdayCondition = weather?.yesterdayConditions else {
            return []
        }
        
        var yesterdayConditionItems: [IconDetailDescriptor] = []
        
        if let high = yesterdayCondition.temperature.first(where: { $0.class == "high" }) {
            let temperature = Temperature.toPreferredUnitFloat(high.value)
            let item = IconDetailDescriptor(symbolName: "arrow.up", text: "\(temperature)°")
            
            yesterdayConditionItems.append(item)
        }
        
        if let low = yesterdayCondition.temperature.first(where: { $0.class == "low" }) {
            let temperature = Temperature.toPreferredUnitFloat(low.value)
            let item = IconDetailDescriptor(symbolName: "arrow.down", text: "\(temperature)°")
            
            yesterdayConditionItems.append(item)
        }
        
        if let precip = yesterdayCondition.precip.first, let value = precip.value {
            let precipFormatted = Float(value) != nil ? value + precip.units : value
            let item = IconDetailDescriptor(symbolName: "cloud.rain.fill", text: precipFormatted)
            
            yesterdayConditionItems.append(item)
        }
        
        return yesterdayConditionItems
    }
}
