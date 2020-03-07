//
//  DailyForecastPagingScrollViewContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-07.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DailyForecastPagingScrollViewContainer: View {
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var weatherService: WeatherService

    var body: some View {
        DailyForecastPagingScrollView(pageWidth: Dimension.WeekSection.pageSize, didChangePage: self.didChangePage) {
            DailyForecastContainer()
        }
        .equatable()
    }

    private func didChangePage(page: Int) {
        appState.setIconCode(to: weatherService.activeLocation?.dailyForecast?.days?[page].iconCode, animated: true)
    }
}

struct DailyForecastPagingScrollViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastPagingScrollViewContainer()
    }
}
