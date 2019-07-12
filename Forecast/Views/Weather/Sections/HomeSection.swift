//
//  HomeSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-06.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

private let TEST_OBSERVATIONS = [
    DetailBlockDescriptor(symbolName: "circle.grid.hex.fill", value: "25%", label: "Humidity"),
    DetailBlockDescriptor(symbolName: "speedometer", value: "101.5 kPa", label: "Pressure"),
    DetailBlockDescriptor(symbolName: "wind", value: "15 km/h", valuePrefix: "WNW", label: "Wind"),
    DetailBlockDescriptor(symbolName: "thermometer", value: "15°", label: "Dewpoint"),
    DetailBlockDescriptor(symbolName: "scope", value: "24.1 km", label: "Visibility"),
    DetailBlockDescriptor(symbolName: "thermometer.sun", value: "32°", label: "Humidex")
]

struct HomeSection: View {
    let viewModel: HomeSectionViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 36) {
            OverviewView(
                timestamp: viewModel.dateStamp,
                stationName: viewModel.stationName,
                temperature: viewModel.currentTemperature,
                observation: viewModel.observation,
                highTemp: viewModel.forecastHigh,
                lowTemp: viewModel.forecastLow
            )
            .padding(.horizontal, 36)

            ScrollView(.horizontal, showsIndicators: false) {
                DetailBlockCollection(items: viewModel.observations, rows: 2, spacing: 10)
                    .padding(.horizontal, 18)
            }
        }
        .padding(.bottom, getBottonSafeMargin() + 18)
        .frame(height: UIScreen.main.bounds.height, alignment: .bottom)
    }

    fileprivate func getBottonSafeMargin() -> CGFloat {
        guard let window = UIApplication.shared.windows.first else {
            return 0
        }

        return window.safeAreaInsets.bottom
    }
}

#if DEBUG
struct HomeSection_Previews: PreviewProvider {
    static var previews: some View {
        HomeSection(viewModel: .init(weather: nil))
    }
}
#endif
