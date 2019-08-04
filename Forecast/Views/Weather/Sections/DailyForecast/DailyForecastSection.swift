//
//  DailyForecastSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DailyForecastSection: View {
    let viewModel: DailyForecastSectionViewModel

    var body: some View {
        LabeledSection(label: "Daily", headerPadding: 36) {
            VStack(spacing: 26) {
                ForEach(self.viewModel.items, id: \.id) { item in
                    DailyForecastView(item: item)
                }
            }
            .padding(.horizontal, 36)
            .padding(.vertical, 6)
        }
    }
}

#if DEBUG
struct DailyForecastSection_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastSection(viewModel: DailyForecastSectionViewModel(weather: nil))
    }
}
#endif
