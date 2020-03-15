//
//  SettingsSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-29.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SettingsSection: View {
    @EnvironmentObject private var settingsSheetState: SettingsSheetState
    @EnvironmentObject private var weatherService: WeatherService

    var body: some View {
        VStack(alignment: .leading, spacing: 24.0) {
            SettingsSheetCloseButtonRow()

            AppMetadata()
                .equatable()
                .frame(minWidth: 0, maxWidth: .infinity)

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
        .padding(20.0)
        .foregroundColor(.white)
        .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
        .background(Color(red: 0.12, green: 0.12, blue: 0.12)
            .edgesIgnoringSafeArea(.all))
    }

    private var stationName: String? {
        weatherService.activeLocation?.currentConditions?.station.name
    }

    private var stationDistance: Int? {
        guard let metres = weatherService.activeLocation?.currentConditions?.station.distanceMetres else {
            return nil
        }

        return metres / 1000
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSection()
    }
}

extension Bundle {
    var displayName: String? {
        return object(forInfoDictionaryKey: kCFBundleNameKey as String) as? String
    }
}
