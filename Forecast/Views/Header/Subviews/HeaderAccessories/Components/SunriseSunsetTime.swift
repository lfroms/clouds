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

        if currentTime.isInRange(date: sunrise.date, and: sunset.date) {
            return SFSymbol.sunsetFilled
        }

        return SFSymbol.sunriseFilled
    }

    private var text: String {
        let riseTime = sunrise.convertTo(region: .current)
        let setTime = sunset.convertTo(region: .current)
        let currentTime = Date().convertTo(region: .current)

        if currentTime.isInRange(date: riseTime, and: setTime) {
            return setTime.toFormat("h:mm a z")
        }

        return riseTime.toFormat("h:mm a z")
    }
}

struct RiseSetView_Previews: PreviewProvider {
    static var previews: some View {
        SunriseSunsetTime(sunrise: DateInRegion(), sunset: DateInRegion())
    }
}
