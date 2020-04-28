//
//  SlidingPanel.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SlidingPanel<Content: View>: View {
    @Binding private var travelDistance: CGFloat
    @Binding private var locked: Bool
    private var content: () -> Content

    @inlinable init(
        travelDistance: Binding<CGFloat>,
        locked: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._travelDistance = travelDistance
        self._locked = locked
        self.content = content
    }

    var body: some View {
        GeometryReader { (geometry: GeometryProxy) in
            DrawerScrollView(travelDistance: self.$travelDistance, locked: self.$locked) {
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
        SlidingPanel(travelDistance: .constant(100), locked: .constant(false)) {
            Text("Hello")
        }
    }
}
