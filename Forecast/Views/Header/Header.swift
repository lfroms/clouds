//
//  Header.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct Header: View {
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var provider: WeatherProvider
    @EnvironmentObject private var locationPickerState: LocationPickerState

    var body: some View {
        ZStack(alignment: .top) {
            HeaderGradientBackground()
                .edgesIgnoringSafeArea(.top)

            VStack(alignment: .leading, spacing: Dimension.Header.padding) {
                OmniBar()

                HeaderAccessories()
            }
            .padding(Dimension.Header.padding)
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
