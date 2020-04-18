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
    @State private var currentImageIndex: Int = 0
    @State private var isPlaying: Bool = false

    private var timer = LoadingTimer()

    @ObservedObject private var timestampStore = TimestampStore()
    @EnvironmentObject private var locationFavoritesService: LocationFavoritesService
    @EnvironmentObject private var locationService: LocationService

    var body: some View {
        ZStack(alignment: .bottom) {
            RadarMapView(
                currentImage: currentImageIndex,
                timestamps: timestamps,
                activeLocationCoordinates: currentCoordinates
            )
            .onReceive(
                timer.publisher,
                perform: { _ in
                    if !self.isPlaying {
                        return
                    }

                    let newIndex = self.currentImageIndex + 1

                    if newIndex >= self.timestampStore.timestamps.count {
                        self.currentImageIndex = 0
                    } else {
                        self.currentImageIndex = newIndex
                    }
                }
            )
            .onAppear { self.timer.start() }
            .onDisappear { self.timer.cancel() }

            RadarControls(
                isPlaying: $isPlaying,
                totalImages: timestampStore.timestamps.count,
                currentImage: currentImageIndex,
                imageDate: timestamps[safe: currentImageIndex]
            )
        }
        .frame(width: UIScreen.main.bounds.width)
        .onAppear {
            self.timestampStore.getRadarTimestamps()
        }
    }

    private var timestamps: [Date] {
        self.timestampStore.timestamps.compactMap { Date(seconds: $0) }
    }

    private var currentCoordinates: CLLocationCoordinate2D? {
        self.locationFavoritesService.getActiveLocation()?.coordinate ?? self.locationService.lastLocation?.coordinate
    }
}

struct RadarSection_Previews: PreviewProvider {
    static var previews: some View {
        RadarSection()
    }
}

class LoadingTimer {
    let publisher = Timer.publish(every: 0.4, on: .main, in: .default)
    private var timerCancellable: Cancellable?

    func start() {
        self.timerCancellable = self.publisher.connect()
    }

    func cancel() {
        self.timerCancellable?.cancel()
    }
}
