//
//  AppActivityIndicator.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AppActivityIndicator: View {
    @State private var isAnimating: Bool = false

    var color: Color = .primary

    var body: some View {
        IndicatorShape(size: 12, weight: 2, color: color)
            .rotationEffect(rotationEffect, anchor: .center)
            .onAppear(perform: runAnimation)
    }

    private var rotationEffect: Angle {
        .degrees(isAnimating ? 360 : 0)
    }

    private func runAnimation() {
        withAnimation(Animation.linear(duration: 0.8).repeatForever(autoreverses: false)) {
            self.isAnimating.toggle()
        }
    }
}

struct LineActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        AppActivityIndicator()
    }
}
