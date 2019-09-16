//
//  ContentView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-06-27.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var provider: WeatherProvider = WeatherProvider()

    var body: some View {
        ZStack(alignment: Alignment.topTrailing) {
            BackgroundColor(iconCode: iconCode)
                .edgesIgnoringSafeArea(.all)

            WeatherIllustration(iconCode: iconCode)
                .edgesIgnoringSafeArea(.top)

            VStack(spacing: 0) {
                Spacer()
                HomeSection(viewModel: .init(weather: provider.weather))
                    .padding(.bottom, DrawerCardConstants.initialHeight)
                    .padding(.bottom, 20)
            }
            .edgesIgnoringSafeArea(.bottom)

            ScrollView(.vertical, showsIndicators: false) {
                DrawerCard {
                    VStack(alignment: .leading, spacing: 28) {
                        VStack(spacing: 0) {
                            HourlyForecastSection(viewModel: .init(weather: self.provider.weather))
                                .frame(height: self.firstSectionHeight, alignment: .top)

                            CurrentData(viewModel: .init(weather: self.provider.weather))
                        }

                        DailyForecastSection(viewModel: .init(weather: self.provider.weather))
                        SunriseSunsetSection(viewModel: .init(weather: self.provider.weather))
                        YesterdayConditionsSection(viewModel: .init(weather: self.provider.weather))
                        RegionalNormalsSection(viewModel: .init(weather: self.provider.weather))
                    }
                }
                .padding(.top, DrawerCardConstants.initialDistanceFromTop)
            }
            .edgesIgnoringSafeArea(.vertical)

            MenuButton(action: handleMenuButtonPress)
                .position(x: 50, y: 36)

            renderWarningBanner()
        }
        .colorScheme(.dark)
    }

    private var firstSectionHeight: CGFloat {
        DrawerCardConstants.initialHeight - DrawerCardConstants.handleHeight - DrawerCardConstants.handlePadding
    }

    private func renderWarningBanner() -> WarningsHeader? {
        guard let warnings = provider.weather?.warnings else {
            return nil
        }

        return WarningsHeader(warnings: warnings.events, url: warnings.url)
    }

    private var iconCode: Int {
        return provider.weather?.currentConditions?.iconCode ?? 06
    }

    fileprivate func handleMenuButtonPress() {
        print("testing")
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
