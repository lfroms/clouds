//
//  AlertListContainer.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-04-26.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AlertListContainer: View {
    @EnvironmentObject private var weatherService: WeatherService
    @EnvironmentObject private var appState: AppState

    @State private var showingSheet: Bool = false
    @State private var currentURL: URL?

    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack {
                if appState.showingAlerts {
                    Color.black.opacity(0.88).ignoresSafeArea(.all)
                        .transition(AnyTransition.opacity.animation(.easeInOut))
                        .onTapGesture {
                            self.appState.showingAlerts = false
                        }
                }
            }

            ZStack {
                if appState.showingAlerts {
                    AlertList(alerts: alerts, didSelect: self.didSelect(alert:), didClose: self.didClose)
                        .equatable()
                        .padding(Dimension.Global.padding)
                        .transition(AnyTransition.move(edge: .bottom).combined(with: alertListTransition))
                        .animation(.easeInOut)
                }
            }
        }
        .sheet(isPresented: $showingSheet) {
            SafariView(url: self.currentURL)
                .ignoresSafeArea(.all)
        }
    }

    private var alertListTransition: AnyTransition {
        .asymmetric(
            insertion: AnyTransition.opacity.animation(Animation.easeInOut.delay(0.1)),
            removal: AnyTransition.opacity.animation(Animation.easeInOut(duration: 0.2))
        )
    }

    private func didSelect(alert: WeatherAlert) {
        currentURL = alert.url
        showingSheet.toggle()
    }

    private func didClose() {
        appState.showingAlerts.toggle()
    }

    private var alerts: [WeatherAlert] {
        guard let alerts = weatherService.weather?.alerts else {
            return []
        }

        return alerts.compactMap {
            WeatherAlert(
                summary: $0.title,
                date: Date(seconds: $0.time).in(region: .current),
                type: warningTypeFor(event: $0),
                status: warningStatusFor(event: $0),
                url: URL(string: $0.url)
            )
        }
    }

    private func warningTypeFor(event: WeatherQuery.Data.Weather.Alert) -> WeatherAlert.WarningType {
        switch event.type {
        case .warning:
            return .warning
        case .watch:
            return .watch
        default:
            return .info
        }
    }

    private func warningStatusFor(event: WeatherQuery.Data.Weather.Alert) -> WeatherAlert.WarningStatus {
        switch event.type {
        case .ended:
            return .ended
        default:
            return .active
        }
    }
}

struct AlertListContainer_Previews: PreviewProvider {
    static var previews: some View {
        AlertListContainer()
    }
}
