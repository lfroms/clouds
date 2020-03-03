//
//  HeaderGradientContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-02.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HeaderGradientContainer: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        HeaderGradient(style: appState.showingLocationPicker ? .prominent : .normal)
            .equatable()
    }
}

struct HeaderGradientContainer_Previews: PreviewProvider {
    static var previews: some View {
        HeaderGradientContainer()
    }
}
