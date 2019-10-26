//
//  BackgroundColor.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-09-13.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct BackgroundColor: View {
    let iconCode: Int

    var body: some View {
        let gradient = Gradient(colors: gradientSteps)

        return LinearGradient(gradient: gradient, startPoint: .topTrailing, endPoint: .bottomLeading)
    }

    private var colorName: String {
        "color-\(iconCode)"
    }

    private var altColorName: String {
        "\(colorName)-alt"
    }

    private var gradientSteps: [Color] {
        [
            Color(colorName),
            Color(altColorName)
        ]
    }
}

struct BackgroundColor_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundColor(iconCode: 0)
    }
}
