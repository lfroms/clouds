//
//  OverviewView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-04.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OverviewView: View {
    let timestamp: Date
    let stationName: String
    let temperature: String
    let observation: String

    var highTemp: Int?
    var lowTemp: Int?

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            MetadataView(timestamp: timestamp, stationName: stationName)

            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 4) {
                    TemperatureView(value: temperature)
                    ObservationView(observation: observation)
                }
                .fixedSize()

                Spacer()

                HighLowStackView(highTemp: highTemp, lowTemp: lowTemp)
            }
        }
    }
}

#if DEBUG
struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView(
            timestamp: Date(),
            stationName: "Ottawa (Kanata – Orléans)",
            temperature: "17",
            observation: "Partly Cloudy"
        )
    }
}
#endif
