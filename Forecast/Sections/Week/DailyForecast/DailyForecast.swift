//
//  DailyForecast.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-29.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation
import SwiftDate

struct DailyForecast {
    let id = UUID()

    let when: String
    let iconCode: Int
    let temperature: Double
    let description: String
    let windSpeed: Int
    let pop: Int
}
