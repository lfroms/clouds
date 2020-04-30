//
//  SlidingPanelContainer.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-03.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SlidingPanelContainer<Content: View>: Container {
    @EnvironmentObject private var appState: AppState

    var content: () -> Content

    @inlinable init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        SlidingPanel(
            isOpen: $appState.drawerIsOpen,
            travelDistance: $appState.detailsContentHeight,
            locked: $appState.slidingPanelLocked
        ) {
            self.content()
        }
        .equatable()
    }
}

struct SlidingPanelContainer_Previews: PreviewProvider {
    static var previews: some View {
        SlidingPanelContainer {
            EmptyView()
        }
    }
}
