//
//  RadarToSettingsStateBinder.swift
//  Overcast
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

    private lazy var appSectionDidChangeCancellable: AnyCancellable? = nil
    private lazy var radarSourceDidChangeCancellable: AnyCancellable? = nil
    private lazy var didBecomeActiveCancellable: AnyCancellable? = nil
    private lazy var willResignActiveCancellable: AnyCancellable? = nil

    init(radarService: RadarService, settingsState: SettingsSheetState, appState: AppState) {
        self.radarService = radarService
        self.settingsState = settingsState
        self.appState = appState

        appSectionDidChangeCancellable = appState.activeSectionDidChange
            .receive(on: RunLoop.main)
            .sink(receiveValue: didChangeAppSection)

        radarSourceDidChangeCancellable = settingsState.radarSourceDidChange
            .receive(on: RunLoop.main)
            .sink(receiveValue: getRadarTimestamps)

        didBecomeActiveCancellable = NotificationCenter.default
            .publisher(for: UIApplication.didBecomeActiveNotification)
            .sink(receiveValue: didBecomeActive)

        willResignActiveCancellable = NotificationCenter.default
            .publisher(for: UIApplication.willResignActiveNotification)
            .sink(receiveValue: willResignActive)
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

    private func willResignActive(_: Notification) {
        radarService.isPlaying = false
    }

    private func getRadarTimestamps() {
        radarService.getRadarTimestamps(for: settingsState.radarSource)
    }

    private func didChangeAppSection() {
        radarService.isPlaying = false
    }
}
