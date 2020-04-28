//
//  DataSourceGroup.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-04-21.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CoreLocation
import SwiftUI

struct DataSourceGroup: View {
    @EnvironmentObject private var weatherService: WeatherService
    @EnvironmentObject private var locationService: LocationService

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

            VStack(alignment: .leading, spacing: 4) {
                if lastUpdatedDate != nil {
                    AttributionText(attribution: "Last updated: \(lastUpdatedDate!)")
                        .equatable()
                }

                AttributionText(attribution: "Data: Environment and Climate Change Canada")
                    .equatable()
            }
        }
    }

    private var stationName: String? {
        weatherService.weather?.location.stationName
    }

    private var lastUpdatedDate: String? {
        guard let stamp = weatherService.weather?.currently.time else {
            return nil
        }

        return Date(seconds: stamp).in(region: .current).toFormat("EEEE, MMMM d 'at' h:mm a")
    }

    private var stationDistance: Int? {
        guard
            let latiude = weatherService.weather?.location.coordinate.latitude,
            let longitude = weatherService.weather?.location.coordinate.longitude
        else {
            return nil
        }

        let stationLocation = CLLocation(latitude: latiude, longitude: longitude)

        guard let distanceMetres = locationService.lastLocation?.distance(from: stationLocation) else {
            return nil
        }

        return Int(distanceMetres / 1000)
    }
}

struct DataSourceGroup_Previews: PreviewProvider {
    static var previews: some View {
        DataSourceGroup()
    }
}
