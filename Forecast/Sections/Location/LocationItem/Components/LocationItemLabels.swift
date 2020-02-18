//
//  LocationItemLabels.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-17.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationItemLabels: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(Font.callout.weight(.bold))
                .foregroundColor(.primary)

            Text(subtitle)
                .font(Font.caption.bold())
                .foregroundColor(Color.primary.opacity(0.6))
        }
    }
}

struct LocationItemLabels_Previews: PreviewProvider {
    static var previews: some View {
        LocationItemLabels(title: "Ottawa", subtitle: "ON, Canada")
    }
}
