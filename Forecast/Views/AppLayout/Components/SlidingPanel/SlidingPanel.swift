//
//  SlidingPanel.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SlidingPanel<Content: View>: View {
    var travelDistance: CGFloat
    var locked: Bool = false
    var content: () -> Content

    @inlinable public init(travelDistance: CGFloat, locked: Bool, @ViewBuilder content: @escaping () -> Content) {
        self.travelDistance = travelDistance
        self.locked = locked
        self.content = content
    }

    var body: some View {
        GeometryReader { (geometry: GeometryProxy) in
            DrawerScrollView(travelDistance: self.travelDistance, locked: self.locked) {
                self.content()
                    .frame(height: geometry.size.height)
                    .edgesIgnoringSafeArea(.all)
            }
            .equatable()
        }
    }
}

extension SlidingPanel: Equatable {
    static func == (lhs: SlidingPanel<Content>, rhs: SlidingPanel<Content>) -> Bool {
        lhs.travelDistance == rhs.travelDistance && lhs.locked == rhs.locked
    }
}

struct SlidingPanel_Previews: PreviewProvider {
    static var previews: some View {
        SlidingPanel(travelDistance: 100, locked: false) {
            Text("Hello")
        }
    }
}
