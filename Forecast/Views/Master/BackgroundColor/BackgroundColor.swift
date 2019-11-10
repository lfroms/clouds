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

    private static let colorPrefix = "color"

    private var highColorName: String {
        "\(Self.colorPrefix)-\(iconCode)-high"
    }

    private var lowColorName: String {
        "\(Self.colorPrefix)-\(iconCode)-low"
    }

    private var gradientSteps: [Color] {
        [
            Color(highColorName),
            Color(lowColorName)
        ]
    }
}

struct BackgroundColor_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundColor(iconCode: 0)
    }
}
