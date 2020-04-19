//
//  OmniBarAuxiliaryButton.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-25.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OmniBarAuxiliaryButton: View, Equatable {
    var icon: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .frame(width: size, height: size)
                .background(Circle().foregroundColor(Color.white.opacity(0.16)))
        }
        .padding(.trailing, 5)
    }

    private var size: CGFloat {
        Dimension.Header.omniBarHeight - 10
    }

    // MARK: - Equatable

    static func == (lhs: OmniBarAuxiliaryButton, rhs: OmniBarAuxiliaryButton) -> Bool {
        lhs.icon == rhs.icon
    }
}

struct OmniBarSettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        OmniBarAuxiliaryButton(icon: "slider.horizontal.3", action: {})
    }
}
