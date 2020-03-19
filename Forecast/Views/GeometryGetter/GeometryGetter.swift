//
//  GeometryGetter.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-18.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct GeometryGetter: View {
    @Binding var rect: CGRect
    var customCondition: (CGRect, CGRect) -> Bool

    var body: some View {
        return GeometryReader { geometry in
            self.makeView(geometry: geometry)
        }
    }

    func makeView(geometry: GeometryProxy) -> some View {
        let newRect = geometry.frame(in: .global)
        let outputView = Rectangle().fill(Color.clear)

        guard rect != newRect, customCondition(rect, newRect) else {
            return outputView
        }

        let newRectIsVisible = newRect.intersects(UIScreen.main.bounds)
        let hasLeftScreen = rect.intersects(UIScreen.main.bounds) && !newRectIsVisible

        if newRectIsVisible || hasLeftScreen {
            DispatchQueue.main.async {
                self.rect = newRect
            }
        }

        return outputView
    }
}
