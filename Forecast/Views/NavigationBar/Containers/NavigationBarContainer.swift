//
//  NavigationBarContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-03.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct NavigationBarContainer: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        NavigationBar(activeSection: $appState.activeSection, tabs: AppSection.list)
    }
}

struct NavigationBarContainer_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarContainer()
    }
}
