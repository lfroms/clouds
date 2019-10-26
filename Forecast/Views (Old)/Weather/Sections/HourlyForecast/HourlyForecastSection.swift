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
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach(self.viewModel.items, id: \.id) { item in
                    HourlyForecastView(viewModel: item)
                }
            }
            .padding(.horizontal, 26)
            .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
        }
    }
}

#if DEBUG
struct HourlyForecastSection_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastSection(viewModel: .init(weather: nil))
    }
}
#endif
