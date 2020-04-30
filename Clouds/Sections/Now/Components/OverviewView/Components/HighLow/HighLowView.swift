//
//  HighLowView.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-07-05.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HighLowView: View {
    @Environment(\.sizeCategory) var sizeCategory

    var highOrLow: HighLow
    var temperature: Int

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 8) {
            Image(systemName: symbolName)
                .font(Font.system(size: UIFontMetrics.default.scaledValue(for: 20)).weight(.bold))

            Text("\(temperature)°")
                .font(.system(size: UIFontMetrics.default.scaledValue(for: 36)))
                .fontWeight(.bold)
        }
        .foregroundColor(AppColor.Display.primary.opacity(0.6))
    }

    private var symbolName: String {
        highOrLow == .high ? SFSymbol.arrowUp : SFSymbol.arrowDown
    }

    enum HighLow {
        case high
        case low
    }
}

extension HighLowView: Equatable {
    static func == (lhs: HighLowView, rhs: HighLowView) -> Bool {
        lhs.highOrLow == rhs.highOrLow
            && lhs.temperature == rhs.temperature
            && lhs.sizeCategory == rhs.sizeCategory
    }
}

struct HighLowView_Previews: PreviewProvider {
    static var previews: some View {
        HighLowView(highOrLow: .high, temperature: 14)
    }
}
