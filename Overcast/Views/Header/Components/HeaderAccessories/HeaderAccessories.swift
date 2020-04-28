//
//  HeaderAccessories.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HeaderAccessories: View, Equatable {
    var sunriseSunset: SunriseSunsetData?
    var sunriseSunsetHidden: Bool
    var loading: Bool

    var body: some View {
        HStack {
            if sunriseSunset != nil {
                SunriseSunsetTime(
                    sunrise: sunriseSunset!.sunriseUTC,
                    sunset: sunriseSunset!.sunsetUTC
                )
                .equatable()
                .opacity(sunriseSunsetHidden ? 0 : 1)
            }

            Spacer()

            if loading {
                AppActivityIndicator(style: .dark)
                    .equatable()
                    .opacity(0.8)
            }
        }
        .foregroundColor(AppColor.Display.secondaryBright)
    }

    // MARK: - Equatable

    static func == (lhs: HeaderAccessories, rhs: HeaderAccessories) -> Bool {
        lhs.sunriseSunset == rhs.sunriseSunset
            && lhs.sunriseSunsetHidden == rhs.sunriseSunsetHidden
            && lhs.loading == rhs.loading
    }
}

struct HeaderAccessories_Previews: PreviewProvider {
    static var previews: some View {
        HeaderAccessories(
            sunriseSunset: nil,
            sunriseSunsetHidden: false,
            loading: false
        )
    }
}
