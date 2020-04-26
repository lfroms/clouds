//
//  CurrentLocationGroup.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-14.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct CurrentLocationGroup: View {
    var location: StoredLocation
    @Binding var loading: Bool

    var onSelectLocation: (StoredLocation) -> Void

    var body: some View {
        LocationPickerListSection(
            label: "Current location",
            loading: $loading
        ) {
            WeatherLocationItem(
                style: .current,
                location: self.location,
                action: self.onSelectLocation
            )
            .equatable()
        }
    }
}

extension CurrentLocationGroup: Equatable {
    static func == (lhs: CurrentLocationGroup, rhs: CurrentLocationGroup) -> Bool {
        lhs.location == rhs.location && lhs.loading == rhs.loading
    }
}

struct CurrentLocationGroup_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationGroup(
            location: StoredLocation(name: "Location", regionName: "Region", coordinate: .init()),
            loading: .constant(false),
            onSelectLocation: { _ in }
        )
    }
}
