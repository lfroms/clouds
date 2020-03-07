//
//  DailyForecast.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-07.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DailyForecast: View {
    var days: [DailyForecastItemData]

    var body: some View {
        VStack {
            // Push content to bottom
            Spacer()

            HStack(alignment: .top, spacing: Dimension.WeekSection.cardSpacing) {
                ForEach(self.days, id: \.self) { day in
                    DailyForecastItem(data: day)
                        .equatable()
                }
            }
            .padding(Dimension.Header.padding)
        }
    }
}

extension DailyForecast: Equatable {
    static func == (lhs: DailyForecast, rhs: DailyForecast) -> Bool {
        lhs.days == rhs.days
    }
}

struct DailyForecast_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecast(days: [])
    }
}
