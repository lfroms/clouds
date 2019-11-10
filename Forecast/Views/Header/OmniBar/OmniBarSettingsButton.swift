//
//  OmniBarSettingsButton.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-25.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OmniBarSettingsButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "slider.horizontal.3")
        }
    }
}

struct OmniBarSettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        OmniBarSettingsButton(action: {})
    }
}
