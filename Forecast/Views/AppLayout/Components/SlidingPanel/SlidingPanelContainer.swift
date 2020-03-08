//
//  SlidingPanelContainer.swift
//  Forecast
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
        SlidingPanel(travelDistance: travelDistance, locked: self.isLocked) {
            content()
        }
    }

    private var isLocked: Bool {
        self.appState.slidingPanelLocked
    }

    private var travelDistance: CGFloat {
        self.appState.detailsContentHeight
    }
}

struct SlidingPanelContainer_Previews: PreviewProvider {
    static var previews: some View {
        SlidingPanelContainer {
            EmptyView()
        }
    }
}
