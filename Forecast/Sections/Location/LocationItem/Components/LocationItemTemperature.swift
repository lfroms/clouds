//
//  LocationItemTemperature.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-17.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationItemTemperature: View {
    let text: String

    var body: some View {
        Text(text)
            .font(Font.title.bold())
    }
}

struct LocationItemTemperature_Previews: PreviewProvider {
    static var previews: some View {
        LocationItemTemperature(text: "23")
    }
}
