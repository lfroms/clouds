//
//  HourlyForecast.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-03.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftDate
import SwiftUI

struct HourlyForecast: View {
    var items: [HourlyForecastItemData]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach(items, id: \.self) { item in
                    HourlyForecastItem(data: item)
                        .equatable()
                }
            }
            .padding(.horizontal, 20)
            .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
        }
        .frame(height: 140, alignment: .top)
    }
}

extension HourlyForecast: Equatable {
    static func == (lhs: HourlyForecast, rhs: HourlyForecast) -> Bool {
        lhs.items == rhs.items
    }
}

struct HourlyForecast_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecast(items: [])
    }
}
