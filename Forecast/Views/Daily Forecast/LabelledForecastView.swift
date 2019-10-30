//
//  LabelledForecastView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LabelledForecastView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Today")
                .font(Font.callout.bold())
                .foregroundColor(.white)
                .padding(.leading, 16)

            ForecastView()
        }
    }
}

struct LabelledForecastView_Previews: PreviewProvider {
    static var previews: some View {
        LabelledForecastView()
    }
}
