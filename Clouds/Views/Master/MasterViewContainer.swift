//
//  MasterViewContainer.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-03.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct MasterViewContainer: Container {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var settingsSheetState: SettingsSheetState

    var body: some View {
        MasterView(handleExists: !self.appState.slidingPanelLocked) {
            CurrentSectionContainer()
        }
        .equatable()
        .sheet(isPresented: $settingsSheetState.presented) {
            SettingsSection()
                .preferredColorScheme(.dark)
                .environmentObject(settingsSheetState)
        }
    }
}

struct MasterViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        MasterViewContainer()
    }
}
