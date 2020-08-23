//
//  WeatherIllustration.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-09-13.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct WeatherIllustration: View {
    @EnvironmentObject private var visualState: VisualState

    @State private var alternateImage: Bool = false
    @State private var imageA: Image?
    @State private var imageB: Image?

    var body: some View {
        ZStack(alignment: .topTrailing) {
            if imageA != nil {
                WeatherIllustrationImage(image: imageA!, shouldScale: shouldScaleImage)
                    .equatable()
                    .transition(transition)
            }

            if imageB != nil {
                WeatherIllustrationImage(image: imageB!, shouldScale: shouldScaleImage)
                    .equatable()
                    .transition(transition)
            }
        }
        .animation(.spring())
        .onChange(of: visualState.appearance) { newAppearance in
            setImage(WeatherImageStyle[newAppearance.style, newAppearance.scheme])
        }
    }

    private let transition: AnyTransition = .asymmetric(
        insertion: AnyTransition.move(edge: .trailing).combined(with: .opacity),
        removal: .opacity
    )

    private func setImage(_ image: Image?) {
        if alternateImage {
            imageB = image
            imageA = nil

        } else {
            imageA = image
            imageB = nil
        }

        alternateImage.toggle()
    }

    private var shouldScaleImage: Bool {
        ![.fog, .snow].contains(visualState.appearance.style)
    }
}

struct WeatherIllustration_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIllustration()
    }
}
