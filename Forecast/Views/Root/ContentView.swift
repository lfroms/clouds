//
//  ContentView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-06-27.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

private let tabs: [String] = ["Now", "Week", "Radar"]

class ContentViewModel: ObservableObject {
    @Published var activeTabIndex: Int = 0 {
        didSet {
            slidingPanelLocked = activeTabIndex != 0
        }
    }

    @Published var slidingPanelLocked = false
}

struct ContentView: View {
    @EnvironmentObject var weatherProvider: WeatherProvider

    @ObservedObject var vm = ContentViewModel()

    var body: some View {
        return ZStack {
            BlackBackground()
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading, spacing: 18) {
                ZStack(alignment: .top) {
                    ZStack(alignment: .bottom) {
                        Text("text")

                        SlidingPanel(locked: self.$vm.slidingPanelLocked) {
                            MasterView(
                                useAsContainer: self.vm.activeTabIndex == 2,
                                drawerHandleHidden: self.$vm.slidingPanelLocked,
                                iconCode: self.iconCode
                            ) {
                                ActiveTab(index: self.$vm.activeTabIndex)
                            }
                        }
                        .edgesIgnoringSafeArea(.top)
                    }

                    Header()
                }

                NavigationBar(activeTabIndex: $vm.activeTabIndex, tabs: tabs)
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
