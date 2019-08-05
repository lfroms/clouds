//
//  RiseSetViewModel.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-11.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Foundation
import SwiftDate

struct RiseSetViewModel {
    let weather: WeatherQuery.Data.Weather?

    var items: [DetailBlockDescriptor] {
        guard let sun = weather?.sun else {
            return []
        }

        return [
            DetailBlockDescriptor(symbolName: "sunrise.fill", value: formattedTime(sun.riseTime), label: "Sunrise"),
            DetailBlockDescriptor(symbolName: "sunset.fill", value: formattedTime(sun.setTime), label: "Sunset")
        ]
    }

    private func formattedTime(_ timestamp: Int) -> String {
        return Date(seconds: TimeInterval(timestamp), region: .UTC)
            .convertTo(region: .current)
            .toFormat("H:mm z", locale: Locales.current)
    }
}
