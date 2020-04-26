//
//  SunriseSunsetTime.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SunriseSunsetTime: View {
    var sunrise: Date
    var sunset: Date

    private static let timeFormat: String = "h:mm a z"

    var body: some View {
        HStack(alignment: .lastTextBaseline, spacing: 5) {
            Image(systemName: symbolName)
                .padding(.bottom, 3)

            Text(text)
        }
        .font(Font.subheadline.weight(.semibold))
    }

    private var symbolName: String {
        let currentTime = Date()

        return currentTime.isInRange(date: sunrise.date, and: sunset.date)
            ? SFSymbol.sunsetFilled
            : SFSymbol.sunriseFilled
    }

    private var text: String {
        let riseTime = sunrise.convertTo(region: .current)
        let setTime = sunset.convertTo(region: .current)
        let currentTime = Date().convertTo(region: .current)

        return currentTime.isInRange(date: riseTime, and: setTime)
            ? setTime.toFormat(Self.timeFormat)
            : riseTime.toFormat(Self.timeFormat)
    }
}

extension SunriseSunsetTime: Equatable {
    static func == (lhs: SunriseSunsetTime, rhs: SunriseSunsetTime) -> Bool {
        lhs.sunrise == rhs.sunrise && lhs.sunset == rhs.sunset
    }
}

struct RiseSetView_Previews: PreviewProvider {
    static var previews: some View {
        SunriseSunsetTime(sunrise: Date(), sunset: Date())
    }
}
