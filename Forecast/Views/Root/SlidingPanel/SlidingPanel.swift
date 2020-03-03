//
//  SlidingPanel.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SlidingPanel<Content: View>: View {
    var locked: Bool = false
    @EnvironmentObject private var appState: AppState

    var content: () -> Content

    var body: some View {
        GeometryReader { (geometry: GeometryProxy) in
            MainPagingScrollView(travelDistance: self.appState.detailsContentHeight, locked: self.locked) {
                self.content()
                    .frame(height: geometry.size.height)
                    .edgesIgnoringSafeArea(.all)
            }
            .equatable()
        }
    }
}

struct SlidingPanel_Previews: PreviewProvider {
    static var previews: some View {
        SlidingPanel(locked: false) {
            EmptyView()
        }
    }
}
