//
//  WeatherIllustration.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-09-13.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct WeatherIllustration: View {
    let iconCode: Int

    var body: some View {
        Image(imageName)
            .shadow(color: Self.shadowColor, radius: 13, x: 0, y: 2)
    }

    private var imageName: String {
        "image-\(iconCode)"
    }

    private static var shadowColor: Color {
        Color.black.opacity(0.25)
    }
}

struct WeatherIllustration_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIllustration(iconCode: 0)
    }
}
