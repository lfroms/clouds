//
//  WeatherBackground.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2019-09-13.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct WeatherBackground: View {
    @EnvironmentObject private var visualState: VisualState

    @State private var alternateGradient: Bool = false

    @State private var gradientA: [Color] = [
        WeatherColorScheme.empty.upper,
        WeatherColorScheme.empty.lower
    ]

    @State private var gradientB: [Color] = []

    var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: .top, endPoint: .bottom)
            LinearGradient(gradient: Gradient(colors: self.gradientB), startPoint: .top, endPoint: .bottom)
                .opacity(self.alternateGradient ? 0 : 1)
        }
        .modifier(ShrinkBackgroundForAppSection())
        .onReceive(self.visualState.appearanceDidChange, perform: self.animateGradient)
    }

    private var gradientSteps: [Color] {
        [
            WeatherColorScheme[visualState.appearance.scheme].upper,
            WeatherColorScheme[visualState.appearance.scheme].lower
        ]
    }

    private func setGradient(steps: [Color]) {
        if alternateGradient {
            gradientB = steps
        } else {
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
