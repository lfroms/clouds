//
//  CurrentSectionContainer.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-03-07.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct CurrentSectionContainer: Container {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        CurrentSection(section: appState.activeSection)
            .equatable()
    }
}

struct CurrentSectionContainer_Previews: PreviewProvider {
    static var previews: some View {
        CurrentSectionContainer()
    }
}
