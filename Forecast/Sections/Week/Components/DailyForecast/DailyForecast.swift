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
    @Binding var activeIndex: Int

    var body: some View {
        VStack {
            // Push content to bottom
            Spacer()

            HStack(alignment: .top, spacing: Dimension.WeekSection.cardSpacing) {
                ForEach(Array(self.days.enumerated()), id: \.element) { index, day in
                    DailyForecastItem(data: day)
                        .equatable()
                        .opacity(index == self.activeIndex ? 1 : 0.45)
                        .animation(.easeInOut)
                }
            }
            .padding(Dimension.Header.padding)
        }
    }
}

extension DailyForecast: Equatable {
    static func == (lhs: DailyForecast, rhs: DailyForecast) -> Bool {
        lhs.days == rhs.days && lhs.activeIndex == rhs.activeIndex
    }
}

struct DailyForecast_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecast(days: [], activeIndex: .constant(0))
    }
}
