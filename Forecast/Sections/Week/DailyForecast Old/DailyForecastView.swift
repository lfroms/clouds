//
//  DailyForecastView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DailyForecastView: View {
    var data: DailyForecastItemData

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(data.when)
                .font(Font.callout.bold())
                .foregroundColor(.white)
                .padding(.leading, 16)

            DailyForecastCard(
                icon: ForecastIcon.forCode(data.iconCode),
                temperature: roundedTemperature,
                description: data.description,
                windSpeed: data.windSpeed,
                pop: data.pop
            )
        }
    }

    private var roundedTemperature: Int {
        return Int(data.temperature.rounded() + 0.0)
    }
}

extension DailyForecastView: Equatable {
    static func == (lhs: DailyForecastView, rhs: DailyForecastView) -> Bool {
        lhs.data == rhs.data
    }
}

struct LabelledForecastView_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastView(
            data: .init(
                when: "Today",
                iconCode: 6,
                temperature: 15.5,
                description: "Some test content.",
                windSpeed: "15",
                pop: 25
            )
        )
    }
}
