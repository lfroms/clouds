//
//  MasterViewContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-03.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct MasterViewContainer: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var weather: WeatherProvider

    var body: some View {
        MasterView(
            usesStandardLayout: self.appState.activeSection == .radar,
            handleExists: !self.appState.slidingPanelLocked,
            handleHidden: self.weather.loading
        ) {
            CurrentSection(section: self.$appState.activeSection)
                .equatable()
        }
        .equatable()
    }
}

struct MasterViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        MasterViewContainer()
    }
}
