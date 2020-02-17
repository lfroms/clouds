//
//  SunriseSunsetTime.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftDate
import SwiftUI

struct SunriseSunsetTime: View {
    @EnvironmentObject private var provider: WeatherProvider

    var body: some View {
        HStack(alignment: .lastTextBaseline, spacing: 5) {
            if !symbolName.isEmpty {
                Image(systemName: symbolName).padding(.bottom, 3)
            }

            Text(text)
        }
        .font(Font.subheadline.weight(.semibold))
        .foregroundColor(.secondary)
    }

    private var symbolName: String {
        guard let sun = provider.weather?.sun else {
            return .empty
        }

        let riseTime = inUTCTime(time: sun.riseTime)
        let setTime = inUTCTime(time: sun.setTime)
        let currentTime = Date()

        if currentTime.isInRange(date: riseTime.date, and: setTime.date) {
            return "sunset.fill"
        }

        return "sunrise.fill"
    }

    private func inUTCTime(time: Int) -> DateInRegion {
        DateInRegion(seconds: TimeInterval(time), region: .UTC)
    }

    private var text: String {
        guard let sun = provider.weather?.sun else {
            return .empty
        }

        let riseTime = inUTCTime(time: sun.riseTime).convertTo(region: .current)
        let setTime = inUTCTime(time: sun.setTime).convertTo(region: .current)
        let currentTime = Date().convertTo(region: .current)

        if currentTime.isInRange(date: riseTime, and: setTime) {
            return setTime.toFormat("h:mm a z")
        }

        return riseTime.toFormat("h:mm a z")
    }
}

struct RiseSetView_Previews: PreviewProvider {
    static var previews: some View {
        SunriseSunsetTime()
    }
}
