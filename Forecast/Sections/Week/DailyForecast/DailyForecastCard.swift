//
//  DailyForecastCard.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DailyForecastCard: View {
    let icon: String
    let temperature: Int
    let description: String
    let windSpeed: String?
    let pop: Int?

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(alignment: .firstTextBaseline, spacing: 5) {
                Image(systemName: self.icon)
                Text("\(self.temperature)°")

                // Needed to push to full width
                Spacer(minLength: 0)
            }
            .font(Font.system(size: 22).bold())

            Text(self.description)
                .font(.footnote)
                .fontWeight(.semibold)

            if parsedWindSpeed != nil || pop != nil {
                HStack(alignment: .center, spacing: 10) {
                    if parsedWindSpeed != nil {
                        DailyForecastDetail(symbol: "wind", text: parsedWindSpeed!)
                    }

                    if pop != nil {
                        DailyForecastDetail(symbol: "umbrella.fill", text: "\(self.pop!)%")
                    }
                }
            }
        }
        .padding(16)
        .background(Color.white.opacity(0.15))
        .cornerRadius(18)
        .frame(width: Dimension.WeekSection.dayCardWidth)
        .background(ShadowView(radius: 30, opacity: 0.08, color: .black, cornerRadius: 18))
        .foregroundColor(.white)
    }

    private var parsedWindSpeed: String? {
        if let windSpeed = windSpeed, let windSpeedInt = Int(windSpeed) {
            return "\(windSpeedInt) km/h"
        }

        return windSpeed
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BlackBackground()
            DailyForecastCard(
                icon: "sun.cloud.fill",
                temperature: 12,
                description: "Some test content.",
                windSpeed: "15",
                pop: 25
            )
        }
        .edgesIgnoringSafeArea(.all)
    }
}
