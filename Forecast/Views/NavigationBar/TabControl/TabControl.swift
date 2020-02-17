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

    @State private var tabFrames: DimensionDictionary = [:]
    private typealias DimensionDictionary = [Int: CGRect]

    var body: some View {
        ZStack(alignment: Alignment.leading) {
            RoundedRectangle(cornerRadius: .infinity)
                .frame(width: activeTabFrame.width, height: activeTabFrame.height)
                .offset(x: activeTabFrame.minX)
                .foregroundColor(Self.indicatorColor)
                .animation(Self.tabHighlightAnimation)

            HStack(alignment: .firstTextBaseline, spacing: 0) {
                ForEach(tabs, id: \.self) { tab in
                    TabView(
                        text: tab,
                        action: self.didPressTab(tab),
                        isActive: self.isActive(tab)
                    )
                    .padding(.vertical, 6)
                    .padding(.horizontal, 16)
                    .fixedSize()
                    .background(TabGeometry(xOffset: 20))
                    .onPreferenceChange(FramePreferenceKey.self, perform: {
                        self.tabFrames[self.indexOfTab(tab)] = $0
                    })
                }
            }
        }
    }

    private var activeTabFrame: CGRect {
        getWithDefaultValue(from: tabFrames, key: activeTab)
    }

    private func getWithDefaultValue(from dictionary: DimensionDictionary, key: Int) -> DimensionDictionary.Value {
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

    private func didPressTab(_ tab: String) -> () -> Void {
        return {
            if !self.isActive(tab) {
                let generator = UISelectionFeedbackGenerator()
                generator.selectionChanged()
            }

            self.activeTab = self.indexOfTab(tab)
        }
    }

    private func indexOfTab(_ tab: String) -> Int {
        return tabs.firstIndex(of: tab) ?? 0
    }

    private func isActive(_ tab: String) -> Bool {
        return indexOfTab(tab) == activeTab
    }
}

struct TabControl_Previews: PreviewProvider {
    static var previews: some View {
        TabControl(activeTab: .constant(0), tabs: [])
    }
}
