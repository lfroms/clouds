//
//  WeatherBackground.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-09-13.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct WeatherBackground: View {
    @EnvironmentObject private var visualState: VisualState

    @State private var alternateGradient: Bool = false
    @State private var gradientA: [Color] = []
    @State private var gradientB: [Color] = []

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: gradientA), startPoint: .top, endPoint: .bottom)
            LinearGradient(gradient: Gradient(colors: gradientB), startPoint: .top, endPoint: .bottom)
                .opacity(alternateGradient ? 0 : 1)
        }
        .onReceive(visualState.iconCodeDidChange, perform: self.animateGradient)
    }

    private var gradientSteps: [Color] {
        [
            AppColor.Weather.schemes[code: visualState.iconCode].upper.color,
            AppColor.Weather.schemes[code: visualState.iconCode].lower.color
        ]
    }

    private func setGradient(steps: [Color]) {
        if alternateGradient {
            gradientB = steps
        }
        else {
            gradientA = steps
        }

        alternateGradient.toggle()
    }

    private func animateGradient(_: VisualState.ObjectWillChangePublisher.Output) {
        setGradient(steps: gradientSteps)
    }
}

struct BackgroundColor_Previews: PreviewProvider {
    static var previews: some View {
        WeatherBackground()
            .environmentObject(VisualState())
    }
}
