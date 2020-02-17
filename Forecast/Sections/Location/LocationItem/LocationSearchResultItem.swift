//
//  LocationSearchResultItem.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationSearchResultItem: View {
    let location: Location

    var body: some View {
        LocationItemContainer {
            LocationItemIcon(name: "map.fill")
            LocationItemLabels(title: self.location.name, subtitle: self.location.regionName)
            Spacer()
        }
    }
}

struct LocationSearchResultItem_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchResultItem(
            location: Location(
                name: "Ottawa",
                regionName: "ON, Canada",
                coordinate: .init(latitude: 0.0, longitude: 0.0)
            )
        )
    }
}
