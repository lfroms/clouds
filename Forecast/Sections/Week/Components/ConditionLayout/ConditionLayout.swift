//
//  ConditionLayout.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ConditionLayout: View {
    @Environment(\.sizeCategory) var sizeCategory

    var data: DailyForecastData.Condition

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .bottom, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    if data.temperature != nil {
                        Text("\(Int(data.temperature!.rounded() + 0.0))°")
                            .font(.system(size: UIFontMetrics.default.scaledValue(for: 40)))
                            .fontWeight(.heavy)
                    }

                    if data.summary != nil {
                        Text("\(data.summary!)")
                            .font(.body)
                            .fontWeight(.bold)
                    }
                }

                Spacer(minLength: 10)

                VStack(alignment: .trailing, spacing: 6) {
                    if data.pop != nil {
                        ConditionIconDetail(symbol: SFSymbol.umbrellaFilled, text: "\(data.pop!)%")
                            .equatable()
                    }

                    if data.windSpeed != nil {
                        ConditionIconDetail(symbol: SFSymbol.wind, text: "\(data.windSpeed!) km/h")
                            .equatable()
                    }
                }
            }

            if data.description != nil {
                Text(data.description!)
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
        }
    }
}

extension ConditionLayout: Equatable {
    static func == (lhs: ConditionLayout, rhs: ConditionLayout) -> Bool {
        lhs.data == rhs.data
    }
}

struct ConditionLayout_Previews: PreviewProvider {
    static var previews: some View {
        ConditionLayout(data:
            .init(
                description: "Test description",
                summary: "Test summary",
                colorScheme: .clearSky,
                temperature: 15,
                windSpeed: nil,
                pop: nil
            )
        )
    }
}
