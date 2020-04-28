//
//  HighLowStack.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2019-07-07.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HighLowStack: View {
    let highTemp: Int?
    let lowTemp: Int?

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            if highTemp != nil {
                HighLowView(highOrLow: .high, temperature: highTemp!)
                    .equatable()
            }

            if lowTemp != nil {
                HighLowView(highOrLow: .low, temperature: lowTemp!)
                    .equatable()
            }
        }
    }
}

extension HighLowStack: Equatable {}

struct HighLowStack_Previews: PreviewProvider {
    static var previews: some View {
        HighLowStack(highTemp: 12, lowTemp: 5)
    }
}
