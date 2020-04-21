//
//  RadarSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Combine
import CoreLocation
import SwiftUI

struct RadarSection: View {
    @EnvironmentObject private var radarService: RadarService

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            RadarMapViewContainer(currentImage: $radarService.currentImageIndex, dates: radarService.dates)

            RadarControls(
                loading: radarService.loading || radarService.dates.isEmpty,
                numberOfFrames: radarService.dates.count,
                playing: $radarService.isPlaying,
                currentFrame: $radarService.currentImageIndex,
                currentDate: radarService.dates[safe: radarService.currentImageIndex]
            )
            .equatable()
            .padding([.horizontal, .bottom], Dimension.RadarSection.RadarControls.bottomPadding)
        }
        .onAppear {
            self.radarService.getRadarTimestamps(for: SettingsSheetState().radarSource)
        }
    }
}

struct RadarSection_Previews: PreviewProvider {
    static var previews: some View {
        RadarSection()
    }
}
