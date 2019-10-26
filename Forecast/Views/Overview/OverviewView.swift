//
//  OverviewView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-04.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OverviewView: View {
    let temperature: String
    let observation: String

    var highTemp: Int?
    var lowTemp: Int?

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 4) {
                    TemperatureView(value: temperature)

                    ObservationView(observation: observation)
                        .lineLimit(2)
                }
                .layoutPriority(1)

                Spacer()

                HighLowStackView(highTemp: highTemp, lowTemp: lowTemp)
                    .layoutPriority(1)
            }
        }
    }
}

#if DEBUG
struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView(
            temperature: "17",
            observation: "Partly Cloudy"
        )
    }
}
#endif
