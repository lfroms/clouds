//
//  ContentView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-06-27.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

private let tabs: [String] = ["Now", "Week", "Radar"]

struct ContentView: View {
    @EnvironmentObject var weatherProvider: WeatherProvider
    @State private var activeTabIndex: Int = 0

    var body: some View {
        ZStack {
            BlackBackground()
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading, spacing: 18) {
                ZStack(alignment: .top) {
                    SlidingPanel {
                        MasterView(iconCode: 1) {
                            ActiveTab(index: self.$activeTabIndex)
                        }
                    }
                    .edgesIgnoringSafeArea(.top)

                    Header()
                }

                NavigationBar(activeTabIndex: $activeTabIndex, tabs: tabs)
                    .padding(.bottom, 8)
            }
        }
        .colorScheme(.dark)
    }

    private var iconCode: Int {
        return weatherProvider.weather?.currentConditions?.iconCode ?? 06
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(WeatherProvider())
    }
}
#endif
