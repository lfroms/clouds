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
        HorizontalPagingScrollView(
            pageWidth: Dimension.WeekSection.pageSize,
            numberOfPages: weather.activeLocation?.dailyForecast?.days?.count ?? 0,
            didChangePage: self.didChangeToPage
        ) {
            DailyForecastGroup()
                .environmentObject(self.weather)
        }
    }

    private func didChangeToPage(page: Int) {
        let newIconCode = weather.activeLocation?.dailyForecast?.days?[page].iconCode
        appState.setIconCode(to: newIconCode, animated: true)
    }
}

struct WeekTab_Previews: PreviewProvider {
    static var previews: some View {
        WeekSection()
    }
}
