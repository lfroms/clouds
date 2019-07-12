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
        guard let dateTime = weather?.riseSet.dateTime else {
            return []
        }

        return dateTime.compactMap({ dateTime in
            guard let timeStamp = dateTime.timeStamp,
                let time = formattedTime(timeStamp) else {
                return nil
            }

            return DetailBlockDescriptor(
                symbolName: symbolNameFor(name: dateTime.name),
                value: time,
                label: dateTime.name
            )
        })
    }

    private func formattedTime(_ timestamp: String) -> String? {
        timestamp
            .toDate("yyyyMMddHHmmss", region: .UTC)?
            .convertTo(region: .current)
            .toFormat("H:mm z", locale: Locales.current)
    }

    private func symbolNameFor(name: String) -> String {
        switch name {
        case "sunrise":
            return "sunrise.fill"
        case "sunset":
            return "sunset.fill"
        default:
            return "sun.fill"
        }
    }
}
