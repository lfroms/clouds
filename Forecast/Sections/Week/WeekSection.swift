//
//  WeekSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct WeekSection: View {
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var weather: WeatherProvider

    var body: some View {
        HorizontalPagingScrollView(pageWidth: 229, numberOfPages: self.days.count, didSwitchToPage: self.didSwitchToPage) {
            HStack(spacing: 14) {
                ForEach(self.days, id: \.id) { day in
                    DailyForecastView(data: day)
                }
            }
            .padding(.horizontal, 20)
        }
        .frame(height: 300)
    }

    private var days: [DailyForecast] {
        guard let days = weather.activeLocation?.dailyForecast?.days else {
            return []
        }

        return days.compactMap { day in
            DailyForecast(
                when: day.when,
                iconCode: day.iconCode,
                temperature: day.temperature,
                description: day.summary,
                windSpeed: day.winds.first?.gust ?? 0,
                pop: day.precipProbability ?? 0
            )
        }
    }

    private func didSwitchToPage(page: Int) {
        appState.masterViewIconCode = weather.activeLocation?.dailyForecast?.days?[page].iconCode ?? 0
    }
}

struct WeekTab_Previews: PreviewProvider {
    static var previews: some View {
        WeekSection()
    }
}
