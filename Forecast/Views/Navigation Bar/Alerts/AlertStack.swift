//
//  AlertStack.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AlertStack: View {
    @EnvironmentObject private var provider: WeatherProvider
    @State private var showWarningDetails: Bool = false

    var body: some View {
        HStack(alignment: .center, spacing: 6, content: alertIndicators)
            .sheet(isPresented: $showWarningDetails, content: renderSheet)
    }

    private func alertIndicators() -> some View {
        let events = provider.weather?.warnings?.events

        var identifiableAlerts: [IdentifiableAlert] = []

        events?.forEach({ event in
            let identifiable = IdentifiableAlert(event: event)
            identifiableAlerts.append(identifiable)
        })

        return ForEach(identifiableAlerts) { _ in
            Button(action: { self.showWarningDetails.toggle() }) {
                AlertIndicator(style: .info)
            }
        }
    }

    private var alertURL: String? {
        provider.weather?.warnings?.url
    }

    private func renderSheet() -> some View {
        let urlObj = URL(string: alertURL ?? "http://weather.gc.ca")
        return SafariView(url: urlObj, readerMode: true).edgesIgnoringSafeArea(.all)
    }
}

struct AlertStack_Previews: PreviewProvider {
    static var previews: some View {
        AlertStack()
    }
}
