//
//  DailyForecastDetail.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DailyForecastDetail: View {
    let symbol: String
    let text: String

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 5) {
            Image(systemName: symbol)
            Text(text)
        }
        .font(Font.footnote.bold())
    }
}

struct ForecastDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastDetail(symbol: "umbrella.fill", text: "25%")
    }
}
