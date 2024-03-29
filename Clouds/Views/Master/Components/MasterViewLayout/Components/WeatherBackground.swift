//
//  WeatherBackground.swift
//  Clouds
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

    @State private var gradientB: [Color] = [
        WeatherColorScheme.empty.upper,
        WeatherColorScheme.empty.lower
    ]

    var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: .top, endPoint: .bottom)
                .id("firstColor")
            LinearGradient(gradient: Gradient(colors: self.gradientB), startPoint: .top, endPoint: .bottom)
                .id("secondColor")
                .opacity(self.alternateGradient ? 0 : 1)
        }
        .modifier(ShrinkBackgroundForAppSection())
        .onChange(of: visualState.appearance) { _ in
            setGradient(steps: gradientSteps)
        }
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
