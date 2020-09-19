//
//  AlertStackContainer.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-04.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CloudsAPI
import SwiftUI

struct AlertStackContainer: Container {
    @EnvironmentObject private var weatherService: WeatherService
    @EnvironmentObject private var appState: AppState

    @ViewBuilder
    var body: some View {
        if alerts.count > 0 {
            AlertStack(alerts: alerts, action: handleAlertAction)
                .equatable()
        }
    }

    private var alerts: [WeatherAlert] {
        weatherService.weather?.alerts.compactMap {
            WeatherAlert(
                summary: $0.title,
                date: Date(seconds: $0.time).convertTo(region: .current),
                type: warningTypeFor(event: $0),
                status: warningStatusFor(event: $0),
                url: URL(string: $0.url)
            )
        } ?? []
    }

    private func warningTypeFor(event: CloudsAPI.WeatherQuery.Data.Weather.Alert) -> WeatherAlert.WarningType {
        switch event.type {
        case .warning:
            return .warning
        case .watch:
            return .watch
        default:
            return .info
        }
    }

    private func warningStatusFor(event: CloudsAPI.WeatherQuery.Data.Weather.Alert) -> WeatherAlert.WarningStatus {
        switch event.type {
        case .ended:
            return .ended
        default:
            return .active
        }
    }

    private func handleAlertAction() {
        appState.showingAlerts.toggle()
    }
}

struct AlertStackContainer_Previews: PreviewProvider {
    static var previews: some View {
        AlertStackContainer()
    }
}
