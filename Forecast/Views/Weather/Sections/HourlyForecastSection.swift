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
                    ForEach(self.viewModel.items.identified(by: \.id)) { item in
                        HourlyForecastView(item: item)
                    }
                }
                .padding(26)
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
