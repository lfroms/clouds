//
//  ContentView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-06-27.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var provider: WeatherProvider = WeatherProvider()

    var body: some View {
        ZStack(alignment: Alignment.topTrailing) {
            EmptyView()
        }
        .colorScheme(.dark)
    }

    private var iconCode: Int {
        return provider.weather?.currentConditions?.iconCode ?? 06
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
