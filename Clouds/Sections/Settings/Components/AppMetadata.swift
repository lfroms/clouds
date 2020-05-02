//
//  AppMetadata.swift
//  Clouds
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

            VStack(alignment: .center, spacing: 0) {
                Text(appName)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                if marketingVersion != nil && buildNumber != nil {
                    Text("\(marketingVersion!) (\(buildNumber!))")
                        .font(.caption)
                        .fontWeight(.regular)
                        .foregroundColor(Color.white.opacity(0.6))
                }
            }
        }
    }

    private var appName: String {
        Bundle.main.displayName ?? "App Name"
    }

    private var marketingVersion: String? {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }

    private var buildNumber: String? {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    }
}

extension AppMetadata: Equatable {}

struct AppMetadata_Previews: PreviewProvider {
    static var previews: some View {
        AppMetadata()
    }
}
