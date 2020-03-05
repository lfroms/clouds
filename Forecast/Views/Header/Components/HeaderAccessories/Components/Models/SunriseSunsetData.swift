//
//  SunriseSunsetData.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-02.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation
import SwiftDate

struct SunriseSunsetData {
    private var sunrise: UnixTimestamp
    private var sunset: UnixTimestamp

    init(sunrise: UnixTimestamp, sunset: UnixTimestamp) {
        self.sunrise = sunrise
        self.sunset = sunset
    }

    var sunriseUTC: DateInRegion {
        DateHelper.inUTCTime(time: sunrise)
    }

    var sunsetUTC: DateInRegion {
        DateHelper.inUTCTime(time: sunset)
    }
}

extension SunriseSunsetData: Equatable {}