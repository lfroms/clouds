//
//  SunriseSunsetTime.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftDate
import SwiftUI

struct SunriseSunsetTime: View, Equatable {
    var sunrise: DateInRegion
    var sunset: DateInRegion

    private static let timeFormat: String = "h:mm a z"

    var body: some View {
        HStack(alignment: .lastTextBaseline, spacing: 5) {
            Image(systemName: symbolName)
                .padding(.bottom, 3)

            Text(text)
        }
        .font(Font.subheadline.weight(.semibold))
        .foregroundColor(.secondary)
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

struct RiseSetView_Previews: PreviewProvider {
    static var previews: some View {
        SunriseSunsetTime(sunrise: DateInRegion(), sunset: DateInRegion())
    }
}
