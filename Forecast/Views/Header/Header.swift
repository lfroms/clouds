//
//  Header.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct Header: View {
    @EnvironmentObject private var provider: WeatherProvider
    @State private var textFieldValue: String?

    var body: some View {
        ZStack(alignment: .top) {
            HeaderGradientBackground()
                .edgesIgnoringSafeArea(.top)

            VStack(alignment: .leading, spacing: 20) {
                OmniBar(textFieldValue: textFieldValueBinding, primaryIcon: "location.fill")

                SunriseSunsetTime()
            }
            .padding(20)
        }
    }

    private var textFieldValueBinding: Binding<String> {
        .init(get: {
            self.textFieldValue ?? self.provider.weather?.location.weatherFor ?? ""
        }, set: { value in
            self.textFieldValue = value
        })
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
