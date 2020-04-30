//
//  OverviewView.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-07-04.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OverviewView: View {
    var temperature: String
    var observation: String

    var highTemp: Int?
    var lowTemp: Int?

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 4) {
                    TemperatureView(value: temperature)
                        .equatable()

                    ConditionView(condition: observation)
                        .equatable()
                        .lineLimit(2)
                }

                Spacer()

                HighLowStack(highTemp: highTemp, lowTemp: lowTemp)
                    .equatable()
            }
        }
        .accessibility(identifier: "now.overview")
    }
}

extension OverviewView: Equatable {}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView(
            temperature: "17",
            observation: "Partly Cloudy",
            highTemp: 10,
            lowTemp: 2
        )
    }
}
