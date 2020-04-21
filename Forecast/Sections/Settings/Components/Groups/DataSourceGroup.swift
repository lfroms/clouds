//
//  DataSourceGroup.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-04-21.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DataSourceGroup: View {
    @EnvironmentObject private var weatherService: WeatherService

    var body: some View {
        VStack(alignment: .leading, spacing: Dimension.Global.padding) {
            if stationName != nil {
                LabeledGroup(label: "Observed at") {
                    HStack {
                        Text(self.stationName!)
                            .font(.body)
                            .fontWeight(.semibold)

                        Spacer()

                        if self.stationDistance != nil {
                            DistanceIndicator(kilometers: self.stationDistance!)
                                .padding(.bottom, -4)
                                .foregroundColor(Color.white.opacity(0.8))
                        }
                    }
                }
            }

            AttributionText(attribution: "Data: Environment and Climate Change Canada")
                .equatable()
        }
    }

    private var stationName: String? {
        weatherService.activeLocation?.location.stationName
    }

    private var stationDistance: Int? {
        guard let metres = weatherService.activeLocation?.location.distance else {
            return nil
        }

        return Int(metres) / 1000
    }
}

struct DataSourceGroup_Previews: PreviewProvider {
    static var previews: some View {
        DataSourceGroup()
    }
}
