//
//  DailyForecastPagingScrollViewContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-07.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DailyForecastPagingScrollViewContainer: View {
    @EnvironmentObject private var weekSectionState: WeekSectionState

    var body: some View {
        DailyForecastPagingScrollView(pageWidth: Dimension.WeekSection.pageSize, didChangePage: self.didChangePage) {
            DailyForecastContainer()
        }
        .equatable()
    }

    private func didChangePage(page: Int) {
        weekSectionState.dayIndex = page
    }
}

struct DailyForecastPagingScrollViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastPagingScrollViewContainer()
    }
}
