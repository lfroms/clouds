//
//  HeaderAccessories.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HeaderAccessories: View, Equatable {
    var hidden: Bool

    var sunriseTimestamp: Int?
    var sunsetTimestamp: Int?

    var observedAtTimestamp: Int?
    var loading: Bool
    var observedAtAction: () -> Void

    var body: some View {
        HStack {
            if sunriseTimestamp != nil && sunsetTimestamp != nil {
                SunriseSunsetTime(
                    sunriseUnixTimestamp: sunriseTimestamp!,
                    sunsetUnixTimestamp: sunsetTimestamp!
                )
                .equatable()
            }

            Spacer()

            if observedAtTimestamp != nil {
                ObservedAtTime(
                    loading: loading,
                    unixTimestamp: observedAtTimestamp!,
                    action: observedAtAction
                )
                .equatable()
            }
        }
        .opacity(hidden ? .zero : .one)
    }

    // MARK: - Equatable

    static func == (lhs: HeaderAccessories, rhs: HeaderAccessories) -> Bool {
        lhs.hidden == rhs.hidden
            && lhs.sunriseTimestamp == rhs.sunriseTimestamp
            && lhs.sunsetTimestamp == rhs.sunsetTimestamp
            && lhs.observedAtTimestamp == rhs.observedAtTimestamp
            && lhs.loading == rhs.loading
    }
}

struct HeaderAccessories_Previews: PreviewProvider {
    static var previews: some View {
        HeaderAccessories(
            hidden: false,
            sunriseTimestamp: 0,
            sunsetTimestamp: 0,
            observedAtTimestamp: 0,
            loading: false,
            observedAtAction: {}
        )
    }
}
