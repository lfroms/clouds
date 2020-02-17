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
        HStack {
            Image(systemName: icon)
                .font(Font.callout.weight(.bold))
            Text(location.name)
                .font(Font.callout.weight(.bold))
            Spacer()
        }
        .padding(.horizontal, 16)
        .frame(height: 57)
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
                coordinate: .init(latitude: 0.0, longitude: 0.0)
            )
        )
    }
}
