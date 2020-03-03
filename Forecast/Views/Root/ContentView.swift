//
//  ContentView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-06-27.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    @EnvironmentObject var weatherProvider: WeatherProvider
//    @EnvironmentObject var appState: AppState

    var body: some View {
        ZStack(alignment: .top) {
            BlackBackground()
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading, spacing: 12) {
                ZStack(alignment: .bottom) {
                    CurrentConditionsView()

                    SlidingPanel(locked: false) {
                        MasterView(
                            useAsContainer: false,
                            hasDrawerHandle: true,
                            drawerHandleHidden: false,
                            iconCode: 0
                        ) {
                            CurrentSection(section: .constant(.now))
                        }
                    }
                    .edgesIgnoringSafeArea(.top)
                }

                NavigationBar(activeSection: .constant(.now), tabs: AppSection.list)
                    .padding(.bottom, 12)
            }

//            LocationPickerSection()
//                .offset(searchOffset)

            Header()
        }
//        .sheet(isPresented: $appState.showingSettingsSheet) {
//            SettingsSection()
//        }
        .colorScheme(.dark)
//        .onReceive(weatherProvider.objectDidReceiveUpdatedWeather) { _ in
//            let iconCode = self.weatherProvider.activeLocation?.currentConditions?.iconCode
//            self.appState.setIconCode(to: iconCode, animated: true)
//        }
    }

//    private var searchOffset: CGSize {
//        return CGSize(width: 0, height: self.appState.showingLocationPicker ? 0 : Dimension.System.screenHeight)
//    }
//
//    private var slidingPanelLocked: Bool {
//        self.appState.slidingPanelLocked || self.weatherProvider.loading
//    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(WeatherProvider())
    }
}
#endif
