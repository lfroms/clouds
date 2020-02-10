//
//  OmniBarAuxiliaryButton.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-25.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OmniBarAuxiliaryButton: View {
    let icon: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
        }
    }
}

struct OmniBarSettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        OmniBarAuxiliaryButton(icon: "slider.horizontal.3", action: {})
    }
}
