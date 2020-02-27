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
        ZStack(alignment: .top) {
            BlackBackground()
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading, spacing: 12) {
                ZStack(alignment: .bottom) {
                    CurrentConditionsView()

                    SlidingPanel(locked: slidingPanelLocked) {
                        MasterView(
                            useAsContainer: self.appState.activeTabIndex == 2,
                            hasDrawerHandle: self.appState.slidingPanelLocked,
                            drawerHandleHidden: self.weatherProvider.loading,
                            iconCode: self.iconCode
                        ) {
                            CurrentSection(index: self.$appState.activeTabIndex)
                        }
                    }
                    .edgesIgnoringSafeArea(.top)
                }

                NavigationBar(activeTabIndex: $appState.activeTabIndex, tabs: tabs)
                    .padding(.bottom, 12)
            }

            LocationPickerSection()
                .offset(searchOffset)

            Header()
        }
        .colorScheme(.dark)
    }

    private var searchOffset: CGSize {
        let screenHeight = UIApplication.shared.windows.first?.frame.height ?? 0

        return CGSize(width: 0, height: self.appState.showingLocationPicker ? 0 : screenHeight)
    }

    private var slidingPanelLocked: Bool {
        self.appState.slidingPanelLocked || self.weatherProvider.loading
    }

    private var iconCode: Int {
        return self.weatherProvider.activeLocation?.currentConditions?.iconCode ?? 06
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
