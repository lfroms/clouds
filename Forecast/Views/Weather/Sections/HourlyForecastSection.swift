//
//  HourlyForecastSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HourlyForecastSection: View {
    let viewModel: HourlyForecastSectionViewModel

    var body: some View {
        LabeledSection(label: "Hourly", headerPadding: 36, tinted: true) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 36) {
                    ForEach(self.viewModel.items, id: \.id) { item in
                        HourlyForecastView(viewModel: item)
                    }
                }
                .padding([.horizontal, .bottom], 26)
                .padding(.top, 23)
            }
        }
    }
}

#if DEBUG
struct HourlyForecastSection_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastSection(viewModel: HourlyForecastSectionViewModel(weather: nil))
    }
}
#endif
