//
//  TabControlContainer.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-04.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TabControlContainer: Container {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        TabControl(tabs: AppSection.list, activeTab: appState.activeSection, didChangeTab: self.didChangeTab)
            .equatable()
    }

    private func didChangeTab(tab: AppSection) {
        appState.navigateToSection(tab, animated: true)
    }
}

struct TabControlContainer_Previews: PreviewProvider {
    static var previews: some View {
        TabControlContainer()
    }
}
