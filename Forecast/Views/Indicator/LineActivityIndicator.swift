//
//  LineActivityIndicator.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LineActivityIndicator: View {
    var color: Color = .primary

    @State private var isAnimating: Bool = false

    var body: some View {
        IndicatorShape(size: 12, weight: 2, color: color)
            .rotationEffect(rotationEffect, anchor: .center)
            .onAppear {
                withAnimation(Animation.linear(duration: 0.8).repeatForever(autoreverses: false)) {
                    self.isAnimating.toggle()
                }
            }
    }

    private var rotationEffect: Angle {
        .degrees(isAnimating ? -360 : 0)
    }
}

struct LineActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LineActivityIndicator()
    }
}
