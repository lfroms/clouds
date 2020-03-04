//
//  TabControl.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TabControl: View {
    @Binding var activeTab: AppSection

    let tabs: [AppSection]

    @State private var tabFrames: DimensionDictionary = [:]
    private typealias DimensionDictionary = [String: CGRect]

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: .infinity)
                .frame(width: activeTabFrame.width, height: activeTabFrame.height)
                .offset(x: activeTabFrame.minX)
                .foregroundColor(Self.indicatorColor)
                .animation(Self.tabHighlightAnimation)

            HStack(alignment: .firstTextBaseline, spacing: 0) {
                ForEach(tabs, id: \.self) { tab in
                    TabView(
                        text: tab.rawValue,
                        action: self.didPressTab(tab),
                        isActive: self.isActive(tab)
                    )
                    .equatable()
                    .padding(.vertical, 6)
                    .padding(.horizontal, 16)
                    .fixedSize()
                    .background(TabGeometry(xOffset: 20).equatable())
                    .onPreferenceChange(FramePreferenceKey.self, perform: {
                        self.tabFrames[tab.rawValue] = $0
                    })
                }
            }
        }
    }

    private var activeTabFrame: CGRect {
        getWithDefaultValue(from: tabFrames, key: activeTab.rawValue)
    }

    private func getWithDefaultValue(from dictionary: DimensionDictionary, key: String) -> DimensionDictionary.Value {
        dictionary[key, default: CGRect(x: 0, y: 0, width: 0, height: 0)]
    }

    private static var tabHighlightAnimation: Animation {
        .spring(
            response: 0.3,
            dampingFraction: 0.7,
            blendDuration: 0
        )
    }

    private static var indicatorColor: Color {
        Color.primary.opacity(0.15)
    }

    private func didPressTab(_ tab: AppSection) -> () -> Void {
        return {
            if !self.isActive(tab) {
                let generator = UISelectionFeedbackGenerator()
                generator.selectionChanged()
            }

            self.activeTab = tab
        }
    }

    private func indexOfTab(_ tab: AppSection) -> Int {
        return tabs.firstIndex(of: tab) ?? 0
    }

    private func isActive(_ tab: AppSection) -> Bool {
        return tab == activeTab
    }
}

extension TabControl: Equatable {
    static func == (lhs: TabControl, rhs: TabControl) -> Bool {
        lhs.activeTab == rhs.activeTab && lhs.tabs == rhs.tabs
    }
}

struct TabControl_Previews: PreviewProvider {
    static var previews: some View {
        TabControl(activeTab: .constant(.now), tabs: [])
    }
}
