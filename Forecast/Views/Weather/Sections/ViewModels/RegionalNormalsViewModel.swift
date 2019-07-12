//
//  RegionalNormalsViewModel.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-11.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Foundation

struct RegionalNormalsViewModel {
    let weather: WeatherQuery.Data.Weather?
    
    var items: [IconDetailDescriptor] {
        guard let regionalNormals = weather?.forecastGroup.regionalNormals else {
            return []
        }
        
        var regionalNormalsItems: [IconDetailDescriptor] = []
        
        if let high = regionalNormals.temperature.first(where: { $0.class == "high" }) {
            let temperature = Temperature.toPreferredUnitInt(high.value)
            let item = IconDetailDescriptor(symbolName: "arrow.up", text: "\(temperature)°")
            
            regionalNormalsItems.append(item)
        }
        
        if let low = regionalNormals.temperature.first(where: { $0.class == "low" }) {
            let temperature = Temperature.toPreferredUnitInt(low.value)
            let item = IconDetailDescriptor(symbolName: "arrow.down", text: "\(temperature)°")
            
            regionalNormalsItems.append(item)
        }
        
        return regionalNormalsItems
    }
}
