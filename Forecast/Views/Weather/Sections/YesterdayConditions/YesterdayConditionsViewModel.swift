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
        guard let yesterday = weather?.yesterday else {
            return []
        }
        
        var yesterdayConditionItems: [IconDetailDescriptor] = []
        
        if let high = yesterday.high {
            yesterdayConditionItems.append(IconDetailDescriptor(symbolName: "arrow.up", text: "\(high)°"))
        }
        
        if let low = yesterday.low {
            yesterdayConditionItems.append(IconDetailDescriptor(symbolName: "arrow.down", text: "\(low)°"))
        }
        
        if let precip = yesterday.precip {
            yesterdayConditionItems.append(IconDetailDescriptor(symbolName: "cloud.rain.fill", text: precip))
        }
        
        return yesterdayConditionItems
    }
}
