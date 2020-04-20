//
//  RadarMapViewContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-04-18.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CoreLocation
import SwiftUI

struct RadarMapViewContainer: Container {
    @EnvironmentObject private var locationFavoritesService: LocationFavoritesService
    @EnvironmentObject private var locationService: LocationService

    @Binding var currentImage: Int
    var dates: [Date]

    var body: some View {
        RadarMapView(
            currentImage: currentImage,
            dates: dates,
            activeLocationCoordinates: activeLocationCoordinates
        )
        .equatable()
        .clipShape(RoundedCornerShape(cornerRadius: Dimension.Global.cornerRadius, style: .continuous, corners: [.bottomLeft, .bottomRight]))
    }

    private var activeLocationCoordinates: CLLocationCoordinate2D? {
        self.locationFavoritesService.getActiveLocation()?.coordinate ?? self.locationService.lastLocation?.coordinate
    }
}

struct RadarMapViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        RadarMapViewContainer(currentImage: .constant(2), dates: [])
    }
}
