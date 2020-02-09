//
//  HeaderAccessories.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HeaderAccessories: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        HStack {
            SunriseSunsetTime()
            Spacer()
            ObservedAtTime()
        }
        .opacity(self.opacity)
    }

    private var opacity: Double {
        self.appState.showingLocationPicker ? 0 : 1
    }
}

struct HeaderAccessories_Previews: PreviewProvider {
    static var previews: some View {
        HeaderAccessories()
    }
}
