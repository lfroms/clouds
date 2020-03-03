//
//  SunriseSunsetDescriptor.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-02.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation
import SwiftDate

struct SunriseSunsetDescriptor {
    private var sunrise: UnixTimestamp
    private var sunset: UnixTimestamp

    init(sunrise: UnixTimestamp, sunset: UnixTimestamp) {
        self.sunrise = sunrise
        self.sunset = sunset
    }

    var sunriseUTC: DateInRegion {
        inUTCTime(time: sunrise)
    }

    var sunsetUTC: DateInRegion {
        inUTCTime(time: sunset)
    }

    private func inUTCTime(time: UnixTimestamp) -> DateInRegion {
        DateInRegion(seconds: TimeInterval(time), region: .UTC)
    }
}

extension SunriseSunsetDescriptor: Equatable {}
