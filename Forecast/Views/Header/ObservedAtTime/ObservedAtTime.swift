//
//  ObservedAtTime.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ObservedAtTime: View {
    @EnvironmentObject private var provider: WeatherProvider
    @State private var now = Date()

    private let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()

    var body: some View {
        Button(action: provider.fetchData) {
            HStack(alignment: VerticalAlignment.lastTextBaseline, spacing: 5) {
                if provider.loading {
                    LineActivityIndicator(color: .secondary)

                } else {
                    Image(systemName: "clock.fill")
                }

                Text(text)
                    .onReceive(timer) { _ in
                        self.now = Date()
                    }
            }
            .font(Font.subheadline.weight(.semibold))
            .foregroundColor(.secondary)
        }
    }

    private var text: String {
        parsedDate?.timeAgo(relativeTo: now) ?? ""
    }

    private var parsedDate: Date? {
        guard let time = provider.weather?.currentConditions?.time else {
            return nil
        }

        return Date(seconds: TimeInterval(time))
    }
}

struct ObservedAtTime_Previews: PreviewProvider {
    static var previews: some View {
        ObservedAtTime()
    }
}
