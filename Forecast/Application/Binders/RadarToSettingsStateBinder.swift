//
//  RadarToSettingsStateBinder.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-04-21.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Combine
import SwiftUI

struct RadarToSettingsStateBinder: ViewModifier {
    private let radarService: RadarService
    private let settingsState: SettingsSheetState
    private let appState: AppState

    private lazy var radarSourceDidChangeCancellable: AnyCancellable? = nil
    private lazy var didBecomeActiveCancellable: AnyCancellable? = nil

    init(radarService: RadarService, settingsState: SettingsSheetState, appState: AppState) {
        self.radarService = radarService
        self.settingsState = settingsState
        self.appState = appState

        radarSourceDidChangeCancellable = settingsState.radarSourceDidChange
            .receive(on: RunLoop.main)
            .sink(receiveValue: getRadarTimestamps)

        didBecomeActiveCancellable = NotificationCenter.default
            .publisher(for: UIApplication.didBecomeActiveNotification)
            .sink(receiveValue: didBecomeActive)
    }

    func body(content: Content) -> some View {
        content
    }

    // MARK: - Binding Functions

    private func didBecomeActive(_: Notification) {
        if appState.activeSection == .radar {
            getRadarTimestamps()
        }
    }

    private func getRadarTimestamps() {
        radarService.getRadarTimestamps(for: settingsState.radarSource)
    }
}
