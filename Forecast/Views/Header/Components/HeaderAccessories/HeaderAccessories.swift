//
//  HeaderAccessories.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HeaderAccessories: View, Equatable {
    var sunriseSunset: SunriseSunsetData?
    var observedAt: ObservedAtData

    var body: some View {
        HStack {
            if sunriseSunset != nil {
                SunriseSunsetTime(
                    sunrise: sunriseSunset!.sunriseUTC,
                    sunset: sunriseSunset!.sunsetUTC
                )
                .equatable()
            }

            Spacer()

            ObservedAtTime(
                loading: observedAt.loading,
                date: observedAt.date,
                action: observedAt.action
            )
            .equatable()
        }
        .foregroundColor(AppColor.Display.secondaryBright)
    }

    // MARK: - Equatable

    static func == (lhs: HeaderAccessories, rhs: HeaderAccessories) -> Bool {
        lhs.sunriseSunset == rhs.sunriseSunset && lhs.observedAt == rhs.observedAt
    }
}

struct HeaderAccessories_Previews: PreviewProvider {
    static var previews: some View {
        HeaderAccessories(
            sunriseSunset: nil,
            observedAt: ObservedAtData(loading: false, timestamp: nil, action: {})
        )
    }
}
