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
    @EnvironmentObject var appState: AppState

    var body: some View {
        ZStack {
            BlackBackground()
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading, spacing: 12) {
                ZStack(alignment: .top) {
                    ZStack(alignment: .bottom) {
                        CurrentConditionsView()

                        SlidingPanel(locked: self.$appState.slidingPanelLocked) {
                            MasterView(
                                useAsContainer: self.appState.activeTabIndex == 2,
                                drawerHandleHidden: self.$appState.slidingPanelLocked,
                                iconCode: self.iconCode
                            ) {
                                CurrentSection(index: self.$appState.activeTabIndex)
                            }
                        }
                        .edgesIgnoringSafeArea(.top)
                    }

                    Header()
                }

                NavigationBar(activeTabIndex: $appState.activeTabIndex, tabs: tabs)
                    .padding(.bottom, 12)
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
