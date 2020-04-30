//
//  SunriseSunsetData.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-02.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation

struct SunriseSunsetData {
    private var sunrise: UnixTimestamp
    private var sunset: UnixTimestamp

    init(sunrise: UnixTimestamp, sunset: UnixTimestamp) {
        self.sunrise = sunrise
        self.sunset = sunset
    }

    var sunriseUTC: Date {
        Date(seconds: sunrise)
    }

    var sunsetUTC: Date {
        Date(seconds: sunset)
    }
}

extension SunriseSunsetData: Equatable {}
