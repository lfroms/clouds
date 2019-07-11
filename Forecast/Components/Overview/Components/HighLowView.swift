//
//  HighLowView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-05.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HighLowView: View {
    var highOrLow: HighLow
    var temperature: Int

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 8) {
            renderIcon()
            renderTemperature()
        }
        .opacity(0.4)
    }

    fileprivate func renderIcon() -> _ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>> {
        let symbolName = highOrLow == .high ? "arrow.up" : "arrow.down"

        return Image(systemName: symbolName)
            .font(Font.system(size: 19).weight(.heavy))
    }

    fileprivate func renderTemperature() -> Text {
        return Text("\(temperature)°")
            .font(.system(size: 36))
            .fontWeight(.heavy)
    }

    enum HighLow {
        case high
        case low
    }
}

#if DEBUG
struct HighLowView_Previews: PreviewProvider {
    static var previews: some View {
        HighLowView(highOrLow: .high, temperature: 14)
    }
}
#endif
