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
    let onPressAction: () -> Void

    var body: some View {
        Button(action: onPressAction) {
            Image(systemName: isHighlighted ? "star.fill" : "star")
        }
        .font(Font.callout.weight(.bold))
        .foregroundColor(isHighlighted ? .yellow : .secondary)
    }
}

struct LocationItemStarButton_Previews: PreviewProvider {
    static var previews: some View {
        LocationItemStarButton(isHighlighted: false, onPressAction: {})
    }
}
