//
//  DailyForecastGroup.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-01.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DailyForecastGroup: View {
    @EnvironmentObject private var weatherService: WeatherService

    var body: some View {
        VStack {
            // Push content to bottom
            Spacer()

            HStack(alignment: .top, spacing: Dimension.WeekSection.cardSpacing) {
                ForEach(self.days, id: \.id) { day in
                    DailyForecastView(data: day)
                }
            }
            .padding(Dimension.Header.padding)
        }
    }

    private var days: [DailyForecast] {
        guard let days = weatherService.activeLocation?.dailyForecast?.days else {
            return []
        }

        return days.compactMap { day in
            DailyForecast(
                when: day.when,
                iconCode: day.iconCode,
                temperature: day.temperature,
                description: day.summary,
                windSpeed: day.winds.first?.speed,
                pop: day.precipProbability
            )
        }
    }
}

struct DailyForecastGroup_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastGroup()
    }
}
