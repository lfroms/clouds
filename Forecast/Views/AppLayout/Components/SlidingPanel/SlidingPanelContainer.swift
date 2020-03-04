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
    @EnvironmentObject private var weather: WeatherProvider

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
        self.appState.slidingPanelLocked || self.weather.loading
    }

    private var travelDistance: CGFloat {
        self.appState.detailsContentHeight
    }
}

extension SlidingPanelContainer: Equatable {
    static func == (lhs: SlidingPanelContainer<Content>, rhs: SlidingPanelContainer<Content>) -> Bool {
        lhs.isLocked == rhs.isLocked && lhs.travelDistance == rhs.travelDistance
    }
}

struct SlidingPanelContainer_Previews: PreviewProvider {
    static var previews: some View {
        SlidingPanelContainer {
            EmptyView()
        }
    }
}
