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

    var body: some View {
        MasterView(handleExists: !self.appState.slidingPanelLocked) {
            CurrentSection(section: self.$appState.activeSection)
                .equatable()
        }
        .equatable()
        .sheet(isPresented: $settingsSheetState.presented) {
            SettingsSection()
        }
    }
}

struct MasterViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        MasterViewContainer()
    }
}
