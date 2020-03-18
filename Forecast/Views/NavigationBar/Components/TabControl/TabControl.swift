//
//  TabControl.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TabControl: View {
    private typealias RectDictionary = [AppSection: CGRect]

    @State private var rects: RectDictionary = RectDictionary()

    var tabs: [AppSection]
    var activeTab: AppSection
    var didChangeTab: (AppSection) -> Void

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
            ForEach(self.tabs, id: \.self) { tab in
                TabView(tab: tab, active: tab == self.activeTab) {
                    self.didChangeTab(tab)
                }
                .equatable()
            }
        }
        .backgroundPreferenceValue(TabPreferenceKey.self) { preferences in
            GeometryReader { geometry in
                ZStack {
                    self.createBackdrop(geometry, preferences)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
        }
    }

    func createBackdrop(_ geometry: GeometryProxy, _ preferences: [TabPreferenceData]) -> some View {
        let preference = preferences.first(where: { $0.activeTab == self.activeTab })
        let bounds = preference != nil ? geometry[preference!.bounds] : .zero

        return RoundedRectangle(cornerRadius: .infinity)
            .frame(width: bounds.size.width, height: bounds.size.height)
            .fixedSize()
            .offset(x: bounds.minX, y: bounds.minY)
            .foregroundColor(AppColor.Control.extraSubdued)
            .animation(AnimationPreset.TabControl.backdropSlide)
    }
}

extension TabControl: Equatable {
    static func == (lhs: TabControl, rhs: TabControl) -> Bool {
        lhs.tabs == rhs.tabs && lhs.activeTab == rhs.activeTab
    }
}

struct TabControl_Previews: PreviewProvider {
    static var previews: some View {
        TabControl(tabs: [.now, .week], activeTab: .now, didChangeTab: { _ in })
    }
}
