//
//  DrawerCard.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-09-14.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DrawerCardConstants {
    public static let initialHeight: CGFloat = 208
    public static let handleHeight: CGFloat = 26
    public static let handlePadding: CGFloat = 10

    public static var initialDistanceFromTop: CGFloat {
        UIScreen.main.bounds.height - Self.initialHeight
    }
}

struct DrawerCard<Content: View>: View {
    let content: () -> Content

    var body: some View {
        ZStack {
            Group {
                GeometryReader(content: createBlurView)
            }

            VStack(spacing: 0) {
                DrawerHandle(height: DrawerCardConstants.handleHeight)

                content()
                    .padding(.top, DrawerCardConstants.handlePadding)
                    .padding(.bottom, 36)
            }
        }
    }

    private func createBlurView(_ geometry: GeometryProxy) -> some View {
        let percentage = self.animationProgress(geometry)
        let targetSaturation: CGFloat = 3

        let saturation = (targetSaturation * percentage).clamped(to: 1...targetSaturation)
        let shadowOpacity = (3 * percentage).clamped(to: 0...1)

        return ZStack {
            ShadowView(radius: 20, opacity: 0.3, color: .black, cornerRadius: 28)
                .opacity(Double(shadowOpacity))

            BlurView(style: .light, tint: 0.7, blurPercentage: percentage)
                .saturation(Double(saturation))
                .cornerRadius(28)
        }
    }

    private static var animationDistance: CGFloat {
        return 180
    }

    private static var animationCompleteDistanceFromTop: CGFloat {
        return DrawerCardConstants.initialDistanceFromTop - animationDistance
    }

    private func animationProgress(_ geometry: GeometryProxy) -> CGFloat {
        let currentTopDistance = geometry.frame(in: .global).minY

        let pixelsTravelled = currentTopDistance - Self.animationCompleteDistanceFromTop
        let percentComplete = pixelsTravelled / Self.animationDistance

        return 1 - percentComplete
    }
}

struct DrawerCard_Previews: PreviewProvider {
    static var previews: some View {
        DrawerCard {
            Text("Test Content")
        }
    }
}
