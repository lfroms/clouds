//
//  HeaderGradientBackground.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-25.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HeaderGradientBackground: View {
    var body: some View {
        let gradient = Gradient(colors: gradientSteps)

        return LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
            .frame(height: 170)
    }

    private var gradientSteps: [Color] {
        [
            Color.black.opacity(0.7),
            Color.black.opacity(0)
        ]
    }
}

struct TopDimGradient_Previews: PreviewProvider {
    static var previews: some View {
        HeaderGradientBackground()
    }
}
