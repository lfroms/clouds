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
        ZStack(alignment: .top) {
            BlackBackground()
                .edgesIgnoringSafeArea(.all)

            MasterView(iconCode: 6) {
                NowTab()
            }
            .edgesIgnoringSafeArea(.top)

            OmniBarBackground()
                .edgesIgnoringSafeArea(.top)

            OmniBar(textFieldValue: "Ottawa (Kanata – Orléans)", primaryIcon: "location.fill")
                .padding(20)
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
