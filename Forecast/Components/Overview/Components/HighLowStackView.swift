//
//  HighLowStackView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-07.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HighLowStackView: View {
    let highTemp: Int?
    let lowTemp: Int?

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            if highTemp != nil {
                HighLowView(highOrLow: .high, temperature: highTemp!)
            }

            if lowTemp != nil {
                HighLowView(highOrLow: .low, temperature: lowTemp!)
            }
        }
    }
}

#if DEBUG
struct HighLowStackView_Previews: PreviewProvider {
    static var previews: some View {
        HighLowStackView(highTemp: 12, lowTemp: 5)
    }
}
#endif
