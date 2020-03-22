//
//  TabView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TabView: View {
    var tab: AppSection
    var active: Bool
    var onPress: () -> Void

    var body: some View {
        Button(action: self.onPress) {
            Text(self.tab.name)
                .font(Font.callout.bold())
                .colorMultiply(active ? .black : .white)
                .animation(.easeInOut(duration: 0.2))
                .padding(.vertical, 6)
                .padding(.horizontal, 16)
                .anchorPreference(
                    key: TabPreferenceKey.self,
                    value: .bounds,
                    transform: { [TabPreferenceData(activeTab: self.tab, bounds: $0)] }
                )
        }
    }
}

extension TabView: Equatable {
    static func == (lhs: TabView, rhs: TabView) -> Bool {
        lhs.tab == rhs.tab && lhs.active == rhs.active
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView(tab: .now, active: true, onPress: {})
    }
}
