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
    }

    private var imageName: String {
        "image-\(iconCode)"
    }
}

struct WeatherIllustration_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIllustration(iconCode: 0)
    }
}
