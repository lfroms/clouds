//
//  DailyForecastItem.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Foundation
import SwiftDate

struct DailyForecastItem {
    let id = UUID()

    let title: String
    let description: String
    let temperature: Int
    let temperatureUnits: String
    let symbolName: String

    var pop: Int?
}
