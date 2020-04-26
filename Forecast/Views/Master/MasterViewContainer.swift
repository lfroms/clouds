//
//  MasterViewContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-03.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct MasterViewContainer: Container {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var settingsSheetState: SettingsSheetState
    @EnvironmentObject var weatherService: WeatherService
    @EnvironmentObject var locationService: LocationService

    var body: some View {
        MasterView(handleExists: !self.appState.slidingPanelLocked) {
            CurrentSectionContainer()
        }
        .equatable()
        .sheet(isPresented: $settingsSheetState.presented) {
            SettingsSection()
                .colorScheme(.dark)
                .environmentObject(self.weatherService)
                .environmentObject(self.settingsSheetState)
                .environmentObject(self.locationService)
        }
    }
}

struct MasterViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        MasterViewContainer()
    }
}
