//
//  WeekSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct WeekSection: View {
    var body: some View {
        HorizontalPagingScrollView(pageWidth: 229) {
            HStack(spacing: 14) {
                DailyForecastView()
                DailyForecastView()
                DailyForecastView()
                DailyForecastView()
                DailyForecastView()
                DailyForecastView()
            }
            .padding(.horizontal, 20)
        }
        .frame(height: 200)
    }
}

struct WeekTab_Previews: PreviewProvider {
    static var previews: some View {
        WeekSection()
    }
}
