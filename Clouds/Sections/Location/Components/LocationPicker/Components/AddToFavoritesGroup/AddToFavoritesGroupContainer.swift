//
//  AddToFavoritesGroupContainer.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-04-21.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AddToFavoritesGroupContainer: Container {
    @EnvironmentObject private var locationFavoritesService: LocationFavoritesService

    var body: some View {
        Group {
            if shouldShowGroup {
                AddToFavoritesGroup(locationName: locationName, action: didPerformAction)
                    .equatable()
            }
        }
    }

    private func didPerformAction() {
        if let activeLocation = locationFavoritesService.activeLocation {
            locationFavoritesService.toggleFavorite(location: activeLocation)
        }
    }

    private var shouldShowGroup: Bool {
        guard let activeLocation = locationFavoritesService.activeLocation else {
            return false
        }

        return !locationFavoritesService.isFavorite(name: activeLocation.name, regionName: activeLocation.regionName)
    }

    private var locationName: String {
        guard let activeLocation = locationFavoritesService.activeLocation else {
            return .empty
        }

        return activeLocation.name
    }
}

struct AddToFavoritesGroupContainer_Previews: PreviewProvider {
    static var previews: some View {
        AddToFavoritesGroupContainer()
    }
}
