//
//  DailyForecastItemData.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-07.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation

struct DailyForecastItemData: Equatable, Hashable {
    let when: String
    let iconCode: Int
    let temperature: Double
    let description: String
    let windSpeed: String?
    let pop: Int?
}
