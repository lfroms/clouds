//
//  TabView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TabView: View {
    @Binding var activeTab: AppSection
    var tab: AppSection

    var body: some View {
        Button(action: self.action) {
            Text(self.tab.name)
                .font(Font.callout.bold())
                .opacity(opacity)
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

    private func action() {
        self.activeTab = self.tab
    }

    private var opacity: Double {
        self.activeTab == self.tab ? .one : 0.6
    }
}

extension TabView: Equatable {
    static func == (lhs: TabView, rhs: TabView) -> Bool {
        lhs.activeTab == rhs.activeTab && lhs.tab == rhs.tab
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView(activeTab: .constant(.now), tab: .now)
    }
}
