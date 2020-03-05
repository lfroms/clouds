//
//  TemperatureView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-04.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TemperatureView: View {
    var value: String

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
            Text(value)
                .fontWeight(.heavy)
            Text("°")
                .fontWeight(.medium)
        }
        .font(.system(size: 72))
        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
        .lineLimit(1)
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView(value: "10")
    }
}
