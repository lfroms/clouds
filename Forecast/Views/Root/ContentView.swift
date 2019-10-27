//
//  ContentView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-06-27.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var weatherProvider: WeatherProvider

    var body: some View {
        ZStack {
            BlackBackground()
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading, spacing: 18) {
                ZStack(alignment: .top) {
                    SlidingPanel {
                        MasterView(iconCode: 6) {
                            NowTab()
                        }
                    }
                    .edgesIgnoringSafeArea(.top)

                    OmniBarBackground()
                        .edgesIgnoringSafeArea(.top)

                    OmniBar(textFieldValue: "Ottawa (Kanata – Orléans)", primaryIcon: "location.fill")
                        .padding(20)
                }

                NavigationBar(tabs: [])
                    .padding(.horizontal, 20)
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
