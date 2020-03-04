//
//  HourlyForecastViewModel.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Foundation
import SwiftDate

struct HourlyForecastViewModel: Hashable {
    let date: DateInRegion
    let symbolName: String

    let temperature: Int
    let temperatureUnits: String

    let windSpeedUnits: String

    var windSpeed: String?
    var pop: String
}
