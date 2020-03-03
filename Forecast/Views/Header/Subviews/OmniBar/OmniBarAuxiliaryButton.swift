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
        }
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
