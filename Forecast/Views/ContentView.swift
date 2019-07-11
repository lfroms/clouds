//
//  ContentView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-06-27.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            WeatherView()
                .edgesIgnoringSafeArea(.vertical)

            MenuButton(action: handleMenuButtonPress)
                .position(x: 50, y: 36)
        }
        .colorScheme(.dark)
    }

    fileprivate func handleMenuButtonPress() {
        print("testing")
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
