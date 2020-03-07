//
//  AlertStackContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-04.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AlertStackContainer: View {
    @EnvironmentObject private var weatherService: WeatherService
    @State private var showWarningDetails: Bool = false

    @ViewBuilder
    var body: some View {
        if alerts.count > 0 {
            AlertStack(alerts: alerts, action: handleAlertAction)
                .equatable()
                .sheet(isPresented: $showWarningDetails, content: renderSheet)
        }
    }

    private var alerts: [WeatherAlert] {
        weatherService.activeLocation?.warnings?.events.compactMap {
            WeatherAlert(
                summary: $0.summary,
                date: DateHelper.inUTCTime(time: $0.time),
                type: warningTypeFor(event: $0),
                status: warningStatusFor(event: $0)
            )
        } ?? []
    }

    private func warningTypeFor(event: WeatherQuery.Data.ActiveLocationWeather.Warning.Event) -> WeatherAlert.WarningType {
        switch event.type {
        case .warning:
            return .warning
        case .watch:
            return .watch
        default:
            return .info
        }
    }

    private func warningStatusFor(event: WeatherQuery.Data.ActiveLocationWeather.Warning.Event) -> WeatherAlert.WarningStatus {
        switch event.type {
        case .ended:
            return .ended
        default:
            return .active
        }
    }

    private func renderSheet() -> AnyView {
        guard let urlString = weatherService.activeLocation?.warnings?.url, let url = URL(string: urlString) else {
            return AnyView(EmptyView())
        }

        return AnyView(SafariView(url: url, readerMode: true)
            .edgesIgnoringSafeArea(.all)
        )
    }

    private func handleAlertAction(alert: WeatherAlert) {
        showWarningDetails.toggle()
    }
}

struct AlertStackContainer_Previews: PreviewProvider {
    static var previews: some View {
        AlertStackContainer()
    }
}
