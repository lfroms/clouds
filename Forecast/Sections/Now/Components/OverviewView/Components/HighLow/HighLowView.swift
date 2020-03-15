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
        .foregroundColor(AppColor.Display.primary.opacity(0.6))
    }

    fileprivate func renderIcon() -> some View {
        let symbolName = highOrLow == .high ? "arrow.up" : "arrow.down"

        return Image(systemName: symbolName)
            .font(Font.system(size: 19).weight(.bold))
    }

    fileprivate func renderTemperature() -> Text {
        return Text("\(temperature)°")
            .font(.system(size: 36))
            .fontWeight(.bold)
    }

    enum HighLow {
        case high
        case low
    }
}

extension HighLowView: Equatable {}

struct HighLowView_Previews: PreviewProvider {
    static var previews: some View {
        HighLowView(highOrLow: .high, temperature: 14)
    }
}
