//
//  LocationItem.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct FavoriteLocationItem: View {
    let icon: String
    let location: Location
    let colorCode: Int
    let temperature: Int

    var body: some View {
        HStack(alignment: .center, spacing: Dimension.Spacing.barItems) {
            Image(systemName: icon)
                .font(Font.callout.weight(.bold))
            Text(location.name)
                .font(Font.callout.weight(.bold))

            Spacer()

            Text(temperatureLabelText)
                .font(Font.title.weight(.bold))
        }
        .padding(.horizontal, 20)
        .frame(height: 57)
        .background(Color.blue)
        .cornerRadius(14)
    }

    private var temperatureLabelText: String {
        "\(temperature)°"
    }
}

struct FavoriteLocationItem_Previews: PreviewProvider {
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
