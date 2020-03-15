//
//  SettingsSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-29.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SettingsSection: View {
    var body: some View {
        ZStack {
            Color(red: 0.12, green: 0.12, blue: 0.12)
                .edgesIgnoringSafeArea(.all)

            Text("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSection()
    }
}
