//
//  LocationPicker.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationPicker: View {
    @EnvironmentObject private var locationSearchService: LocationSearchService

    var body: some View {
        VStack(alignment: .leading, spacing: Dimension.LocationPicker.sectionSpacing) {
            if locationSearchService.searchQuery.isEmpty {
                CurrentLocationGroupContainer()
                FavoriteLocationsGroupContainer()
                AddToFavoritesGroupContainer()
            } else {
                SearchResultsGroupContainer()
            }
        }
        .padding(.vertical, Dimension.Global.padding / 2)
        .padding(.horizontal, Dimension.Global.padding)
    }
}

extension LocationPicker: Equatable {
    static func == (lhs: LocationPicker, rhs: LocationPicker) -> Bool {
        false
    }
}

struct LocationPicker_Previews: PreviewProvider {
    static var previews: some View {
        LocationPicker()
    }
}
