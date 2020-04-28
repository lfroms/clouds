//
//  LocationItemStarButton.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-02-27.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationItemStarButton: View {
    let isHighlighted: Bool
    var monochrome: Bool? = false
    let onPressAction: () -> Void

    @State private var active: Bool = false

    var body: some View {
        Image(systemName: isHighlighted ? SFSymbol.starFilled : SFSymbol.star)
            .scaleEffect(self.active ? 1.5 : 1)
            .animation(.interactiveSpring(response: 0.2, dampingFraction: 0.5))
            .gesture(self.gesture)
            .font(Font.callout.weight(.bold))
            .foregroundColor(color)
    }

    private var gesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { _ in
                guard !self.active else {
                    return
                }

                UISelectionFeedbackGenerator().selectionChanged()
                self.active = true
            }
            .onEnded { value in
                self.active = false

                if hypot(value.location.x - value.startLocation.x, value.location.y - value.startLocation.y) > 50 {
                    return
                }

                UISelectionFeedbackGenerator().selectionChanged()
                self.onPressAction()
            }
    }

    private var color: Color {
        if active {
            return .yellow
        }

        if let monochrome = monochrome, monochrome {
            return .white
        }

        return isHighlighted ? .yellow : AppColor.Display.secondary
    }
}

struct LocationItemStarButton_Previews: PreviewProvider {
    static var previews: some View {
        LocationItemStarButton(isHighlighted: false, onPressAction: {})
    }
}
