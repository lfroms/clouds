//
//  AppMetadata.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-03-15.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AppMetadata: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20.0) {
            Image("SettingsAppIcon")
                .cornerRadius(12)
                .shadow(radius: 16)

            Text(appName)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }

    private var appName: String {
        Bundle.main.displayName ?? "App Name"
    }
}

extension AppMetadata: Equatable {}

struct AppMetadata_Previews: PreviewProvider {
    static var previews: some View {
        AppMetadata()
    }
}
