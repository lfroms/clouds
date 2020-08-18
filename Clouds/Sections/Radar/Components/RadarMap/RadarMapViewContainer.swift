//
//  RadarMapViewContainer.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-04-18.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CoreLocation
import SwiftUI

struct RadarMapViewContainer: Container {
    @EnvironmentObject private var locationFavoritesService: LocationFavoritesService
    @EnvironmentObject private var locationService: LocationService
    @EnvironmentObject private var settingsSheetState: SettingsSheetState

    @Binding var currentImage: Int
    var dates: [Date]
    var shouldLazyLoadImages: Bool = false

    var body: some View {
        RadarMapView(
            currentImage: currentImage,
            dates: dates,
            overlayOpacity: settingsSheetState.radarOpacity,
            dataSource: settingsSheetState.radarSource,
            activeLocationCoordinates: activeLocationCoordinates,
            lazy: shouldLazyLoadImages
        )
        .equatable()
        .clipShape(RoundedCornerShape(cornerRadius: Dimension.Global.cornerRadius, style: .continuous, corners: [.bottomLeft, .bottomRight]))
    }

    private var activeLocationCoordinates: CLLocationCoordinate2D? {
        self.locationFavoritesService.activeLocation?.coordinate ?? self.locationService.lastLocation?.coordinate
    }
}

struct RadarMapViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        RadarMapViewContainer(currentImage: .constant(2), dates: [])
    }
}
