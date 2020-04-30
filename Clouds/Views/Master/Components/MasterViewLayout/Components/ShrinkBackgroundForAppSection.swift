//
//  ShrinkBackgroundForAppSection.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ShrinkBackgroundForAppSection: ViewModifier {
    @EnvironmentObject private var appState: AppState

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .frame(maxHeight: self.shrinkDistance(geometry: geometry), alignment: .top)
                .clipShape(RoundedCornerShape(cornerRadius: Dimension.Global.cornerRadius, style: .continuous, corners: [.bottomLeft, .bottomRight]))
                .opacity(self.opacity)
                .animation(.spring())

            Spacer(minLength: 0)
        }
        .background(Color.black)
    }

    private func shrinkDistance(geometry: GeometryProxy) -> CGFloat? {
        switch appState.activeSection {
        case .now:
            return nil
        case .week:
            return geometry.size.height - Dimension.WeekSection.DayPicker.dayPickerTotalHeight
        case .radar:
            return geometry.size.height - Dimension.RadarSection.RadarControls.totalHeight
        }
    }

    private var opacity: Double {
        if appState.activeSection == .radar {
            return 0
        }

        return 1
    }
}
