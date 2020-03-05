//
//  TabControlContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-04.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TabControlContainer: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        TabControl(tabs: AppSection.list, activeTab: $appState.activeSection)
            .equatable()
    }
}

struct TabControlContainer_Previews: PreviewProvider {
    static var previews: some View {
        TabControlContainer()
    }
}
