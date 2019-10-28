//
//  TabGeometry.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-27.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TabGeometry: View {
    let xOffset: CGFloat

    var body: some View {
        GeometryReader { (geometry: GeometryProxy) in
            Rectangle()
                .foregroundColor(.clear)
                .preference(key: TabWidthPreferenceKey.self, value: geometry.size.width)
                .preference(key: TabHeightPreferenceKey.self, value: geometry.size.height)
                .preference(key: TabOffsetPreferenceKey.self, value: geometry.frame(in: .global).origin.x - self.xOffset)
        }
    }
}
