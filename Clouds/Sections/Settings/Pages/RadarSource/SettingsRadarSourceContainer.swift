//
//  SettingsRadarSourceContainer.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-04-21.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SettingsRadarSourceContainer: View {
    @EnvironmentObject private var settingsSheetState: SettingsSheetState

    var body: some View {
        SettingsRadarSource(selectedSource: $settingsSheetState.radarSource)
    }
}

struct SettingsRadarSourceContainer_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRadarSourceContainer()
    }
}
