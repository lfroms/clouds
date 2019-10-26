//
//  HomeSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-06.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HomeSection: View {
    let viewModel: HomeSectionViewModel

    var body: some View {
        OverviewView(
            temperature: viewModel.currentTemperature,
            observation: viewModel.observation,
            highTemp: viewModel.forecastHigh,
            lowTemp: viewModel.forecastLow
        )
            .padding(.horizontal, 36)
    }
}

#if DEBUG
struct HomeSection_Previews: PreviewProvider {
    static var previews: some View {
        HomeSection(viewModel: .init(weather: nil))
    }
}
#endif
