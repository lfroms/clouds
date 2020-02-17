//
//  LocationItem.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationItem: View {
    let icon: String
    let location: Location

    var body: some View {
        HStack(alignment: .center, spacing: Dimension.Spacing.barItems) {
            Image(systemName: icon)
                .font(Font.callout.weight(.bold))

            VStack(alignment: .leading, spacing: 0) {
                Text(location.name)
                    .font(Font.callout.weight(.bold))

                Text(location.regionName)
                    .font(Font.caption.bold())
                    .foregroundColor(Color.primary.opacity(0.6))
            }

            Spacer()
        }
        .padding(.horizontal, 20)
        .frame(height: Dimension.LocationPicker.itemHeight)
        .background(Color.blue)
        .cornerRadius(14)
    }
}

struct LocationItem_Previews: PreviewProvider {
    static var previews: some View {
        LocationItem(
            icon: "location.fill",
            location: Location(
                name: "Ottawa",
                regionName: "ON, Canada",
                coordinate: .init(latitude: 0.0, longitude: 0.0)
            )
        )
    }
}
