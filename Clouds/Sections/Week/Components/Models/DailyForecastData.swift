//
//  DailyForecastData.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CloudsAPI
import Foundation

struct DailyForecastData: Equatable {
    let date: Date
    let dayCondition: Condition?
    let nightCondition: Condition?

    internal struct Condition: Equatable {
        let description: String?
        let summary: String?
        let colorScheme: CloudsAPI.ColorScheme?
        let temperature: Double?
        let windSpeed: String?
        let pop: Int?
    }
}
