//
//  TabControl.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TabControl: View {
    @Binding var activeTab: Int
    let tabs: [String]

    @State private var tabWidths: [CGFloat] = [0, 0, 0]
    @State private var tabHeights: [CGFloat] = [0, 0, 0]

    @State private var tabOffsets: [CGFloat] = [0, 0, 0]

    var body: some View {
        ZStack(alignment: Alignment.leading) {
            RoundedRectangle(cornerRadius: .infinity)
                .frame(width: tabWidths[activeTab], height: tabHeights[activeTab])
                .offset(x: tabOffsets[activeTab])
                .foregroundColor(Color.primary.opacity(0.15))
                .animation(.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 0))

            HStack(alignment: .firstTextBaseline, spacing: 0) {
                ForEach(tabs, id: \.self) { tab in
                    TabView(
                        text: tab,
                        action: self.didPressTab(named: tab),
                        isActive: self.isActive(tab: tab)
                    )
                        .padding(.vertical, 6)
                    .padding(.horizontal, 16)
                    .fixedSize()
                    .background(TabGeometry(xOffset: 20))
                    .onPreferenceChange(TabWidthPreferenceKey.self, perform: {
                        self.tabWidths[self.indexOfTab(named: tab)] = $0
                    })
                    .onPreferenceChange(TabHeightPreferenceKey.self, perform: {
                        self.tabHeights[self.indexOfTab(named: tab)] = $0
                    })
                    .onPreferenceChange(TabOffsetPreferenceKey.self, perform: {
                        self.tabOffsets[self.indexOfTab(named: tab)] = $0
                    })
                }
            }
        }
    }

    private func didPressTab(named tab: String) -> () -> Void {
        return {
            self.activeTab = self.indexOfTab(named: tab)
        }
    }

    private func indexOfTab(named tab: String) -> Int {
        return tabs.firstIndex(of: tab) ?? 0
    }

    private func isActive(tab: String) -> Bool {
        return indexOfTab(named: tab) == activeTab
    }
}

struct TabControl_Previews: PreviewProvider {
    static var previews: some View {
        TabControl(activeTab: .constant(0), tabs: [])
    }
}
