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
        VStack(alignment: HorizontalAlignment.leading, spacing: 36) {
            OverviewView(
                timestamp: viewModel.dateStamp,
                stationName: viewModel.stationName,
                temperature: viewModel.currentTemperature,
                observation: viewModel.observation,
                highTemp: viewModel.forecastHigh,
                lowTemp: viewModel.forecastLow
            )
            .padding(.horizontal, 36)

            ScrollView(.horizontal, showsIndicators: false) {
                DetailBlockCollection(items: viewModel.observations, rows: 2, spacing: 10)
                    .padding(.horizontal, 18)
            }
        }
        .padding(.bottom, getBottonSafeMargin() + 18)
        .frame(height: UIScreen.main.bounds.height, alignment: .bottom)
    }

    fileprivate func getBottonSafeMargin() -> CGFloat {
        guard let window = UIApplication.shared.windows.first else {
            return 0
        }

        return window.safeAreaInsets.bottom
    }
}

#if DEBUG
struct HomeSection_Previews: PreviewProvider {
    static var previews: some View {
        HomeSection(viewModel: .init(weather: nil))
    }
}
#endif
