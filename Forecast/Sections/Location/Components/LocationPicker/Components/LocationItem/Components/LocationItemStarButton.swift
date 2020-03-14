//
//  LocationItemStarButton.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-27.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationItemStarButton: View {
    let isHighlighted: Bool
    var monochrome: Bool? = false
    let onPressAction: () -> Void

    var body: some View {
        Button(action: onPressAction) {
            Image(systemName: isHighlighted ? "star.fill" : "star")
        }
        .font(Font.callout.weight(.bold))
        .foregroundColor(color)
    }

    private var color: Color {
        if let monochrome = monochrome, monochrome {
            return .primary
        }

        return isHighlighted ? .yellow : .secondary
    }
}

struct LocationItemStarButton_Previews: PreviewProvider {
    static var previews: some View {
        LocationItemStarButton(isHighlighted: false, onPressAction: {})
    }
}
