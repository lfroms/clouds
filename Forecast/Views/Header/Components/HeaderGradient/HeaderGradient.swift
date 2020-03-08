//
//  HeaderGradient.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-25.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HeaderGradient: View, Equatable {
    var style: Style

    internal enum Style {
        case normal
        case prominent
    }

    var body: some View {
        ZStack {
            LinearGradient(gradient: self.standardGradient, startPoint: .top, endPoint: .bottom)
                .frame(height: height)

            LinearGradient(gradient: self.prominentGradient, startPoint: .top, endPoint: .bottom)
                .frame(height: height)
                .opacity(opacity)
        }
    }

    private var opacity: Double {
        switch style {
        case .normal:
            return .zero
        case .prominent:
            return .one
        }
    }

    private var standardGradient: Gradient {
        Gradient(stops: standardGradientStops)
    }

    private var prominentGradient: Gradient {
        Gradient(stops: prominentGradientStops)
    }

    private var standardGradientStops: [Gradient.Stop] {
        [
            Gradient.Stop(color: Color.black.opacity(0.7), location: 0),
            Gradient.Stop(color: Color.black.opacity(0), location: 1)
        ]
    }

    private var prominentGradientStops: [Gradient.Stop] {
        [
            Gradient.Stop(color: Color.black.opacity(1), location: 0.1),
            Gradient.Stop(color: Color.black.opacity(0), location: 1)
        ]
    }

    private var height: CGFloat {
        Dimension.System.topSafeMargin + Dimension.Header.omniBarHeight + (Dimension.Header.padding * 2)
    }
}

struct TopDimGradient_Previews: PreviewProvider {
    static var previews: some View {
        HeaderGradient(style: .normal)
    }
}
