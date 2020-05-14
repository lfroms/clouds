//
//  AppMetadata.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-15.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AppMetadata: View {
    @State private var showingSeedAlert = false

    var body: some View {
        VStack(alignment: .center, spacing: 20.0) {
            Image("SettingsAppIcon")
                .cornerRadius(12)
                .shadow(radius: 16)
                .onLongPressGesture(minimumDuration: 4, maximumDistance: 20) {
                    self.showingSeedAlert.toggle()
                }

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
        .alert(isPresented: $showingSeedAlert) {
            Alert(
                title: Text("Test Mode"),
                message: Text("Replace location favourites with test data?"),
                primaryButton: .default(Text("Confirm"), action: self.seedTestData),
                secondaryButton: .cancel(Text("Cancel"))
            )
        }
    }

    private func seedTestData() {
        Seeder.shared.locationFavoritesService = AppServices.locationFavoritesService
        AppServices.weatherService.setShouldFetchUpdatedWeather()

        Seeder.shared.eraseLocationFavorites()
        Seeder.shared.seedLocationFavorites(setActive: true)
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

extension AppMetadata: Equatable {
    static func == (lhs: AppMetadata, rhs: AppMetadata) -> Bool {
        lhs.showingSeedAlert == rhs.showingSeedAlert
    }
}

struct AppMetadata_Previews: PreviewProvider {
    static var previews: some View {
        AppMetadata()
    }
}
