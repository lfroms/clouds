//
//  CurrentLocationGroup.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-14.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct CurrentLocationGroup: View {
    var location: Location
    var locationWeather: ShortFormWeather?
    @Binding var loading: Bool

    var onSelectLocation: (Location) -> Void

    var body: some View {
        LocationPickerListSection(
            label: "Current Location",
            loading: $loading
        ) {
            LocationItem(
                style: .current,
                location: self.location,
                weather: self.locationWeather,
                action: self.onSelectLocation
            )
            .equatable()
        }
    }
}

extension CurrentLocationGroup: Equatable {
    static func == (lhs: CurrentLocationGroup, rhs: CurrentLocationGroup) -> Bool {
        lhs.location == rhs.location
            && lhs.locationWeather == rhs.locationWeather
            && lhs.loading == rhs.loading
    }
}

struct CurrentLocationGroup_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationGroup(
            location: Location(name: "Location", regionName: "Region", coordinate: .init()),
            loading: .constant(false),
            onSelectLocation: { _ in }
        )
    }
}
