//
//  WeatherView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-06.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject private var provider: WeatherProvider = WeatherProvider()

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image("image-\(iconCode)")
                .shadow(color: Color.black.opacity(0.25), radius: 13, x: 0, y: 2)

            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    HomeSection(viewModel: .init(weather: provider.weather))

                    VStack(alignment: .leading, spacing: 32) {
                        HourlyForecastSection(viewModel: .init(weather: provider.weather))
                        DailyForecastSection(viewModel: .init(weather: provider.weather))
                        SunriseSunsetSection(viewModel: .init(weather: provider.weather))
                        YesterdayConditionsSection(viewModel: .init(weather: provider.weather))
                        RegionalNormalsSection(viewModel: .init(weather: provider.weather))
                    }

                    BottomSafeAreaSpacer()
                        .padding(.bottom, 36)
                }
            }
        }
        .background(backgroundGradient)
    }

    private var backgroundGradient: LinearGradient {
        let gradient = Gradient(colors: [Color("color-\(iconCode)"), Color("color-\(iconCode)-alt")])

        return LinearGradient(gradient: gradient, startPoint: .topTrailing, endPoint: .bottomLeading)
    }

    private var iconCode: Int {
        return provider.weather?.currentConditions?.iconCode ?? 00
    }
}

#if DEBUG
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
#endif
