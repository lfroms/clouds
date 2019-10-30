//
//  NowTab.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct NowTab: View {
    @EnvironmentObject private var weatherProvider: WeatherProvider

    var body: some View {
        VStack(spacing: 32) {
            HomeSection(viewModel: .init(weather: self.weatherProvider.weather))
            HourlyForecastSection(viewModel: .init(weather: self.weatherProvider.weather))
                .frame(height: 140, alignment: .top)
        }
    }
}

struct NowTab_Previews: PreviewProvider {
    static var previews: some View {
        NowTab()
    }
}
