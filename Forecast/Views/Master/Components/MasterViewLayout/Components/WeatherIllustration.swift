//
//  WeatherIllustration.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-09-13.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct WeatherIllustration: View {
    @EnvironmentObject private var visualState: VisualState

    @State private var alternateImage: Bool = false
    @State private var imageA: String = ""
    @State private var imageB: String = ""

    var body: some View {
        ZStack(alignment: .topTrailing) {
            if !imageA.isEmpty {
                Image(imageA)
                    .transition(transition)
            }
            if !imageB.isEmpty {
                Image(imageB)
                    .transition(transition)
            }
        }
        .frame(width: Dimension.System.screenWidth)
        .onReceive(visualState.iconCodeDidChange, perform: self.animateImage)
    }

    private let transition: AnyTransition = .asymmetric(
        insertion: AnyTransition.opacity.combined(with: .move(edge: .trailing)),
        removal: .opacity
    )

    private func setImage(name: String) {
        if alternateImage {
            imageB = name
            imageA.clear()
        } else {
            imageA = name
            imageB.clear()
        }

        alternateImage.toggle()
    }

    private func animateImage(_: VisualState.ObjectWillChangePublisher.Output) {
        setImage(name: imageName)
    }

    private var imageName: String {
        "image-\(visualState.iconCode)"
    }
}

struct WeatherIllustration_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIllustration()
    }
}
