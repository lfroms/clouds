//
//  BackgroundColor.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-09-13.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct BackgroundColor: View {
    @EnvironmentObject private var appState: AppState

    @State private var alternateGradient: Bool = false
    @State private var gradientA: [Color] = []
    @State private var gradientB: [Color] = []

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: gradientA), startPoint: .topTrailing, endPoint: .bottomLeading)
            LinearGradient(gradient: Gradient(colors: gradientB), startPoint: .topTrailing, endPoint: .bottomLeading)
                .opacity(alternateGradient ? 0 : 1)
        }
        .onReceive(appState.objectWillChange, perform: self.animateGradient)
    }

    private static let colorPrefix = "color"

    private var highColorName: String {
        "\(Self.colorPrefix)-\(appState.masterViewIconCode)-high"
    }

    private var lowColorName: String {
        "\(Self.colorPrefix)-\(appState.masterViewIconCode)-low"
    }

    private var gradientSteps: [Color] {
        [
            Color(highColorName),
            Color(lowColorName)
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

    private func animateGradient(_: AppState.ObjectWillChangePublisher.Output) {
        setGradient(steps: gradientSteps)
    }
}

struct BackgroundColor_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundColor()
            .environmentObject(AppState())
    }
}
