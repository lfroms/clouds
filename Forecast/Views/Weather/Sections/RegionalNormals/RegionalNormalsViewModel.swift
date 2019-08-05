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
        guard let normals = weather?.normals else {
            return []
        }
        
        var regionalNormalsItems: [IconDetailDescriptor] = []
        
        if let high = normals.high {
            regionalNormalsItems.append(IconDetailDescriptor(symbolName: "arrow.up", text: "\(high)°"))
        }
        
        if let low = normals.low {
            regionalNormalsItems.append(IconDetailDescriptor(symbolName: "arrow.down", text: "\(low)°")
            )
        }
        
        return regionalNormalsItems
    }
}
