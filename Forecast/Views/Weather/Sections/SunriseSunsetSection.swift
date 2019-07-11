//
//  SunriseSunsetSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

private let TEST_RISESET = [
    DetailBlockDescriptor(symbolName: "sunrise.fill", value: "7:40 EST", label: "Sunrise"),
    DetailBlockDescriptor(symbolName: "sunset.fill", value: "16:23 EST", label: "Sunset")
]

struct SunriseSunsetSection: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            DetailBlockCollection(items: TEST_RISESET, rows: 1, spacing: 10)
                .padding(.horizontal, 18)
        }
    }
}

#if DEBUG
struct SunriseSunsetSection_Previews: PreviewProvider {
    static var previews: some View {
        SunriseSunsetSection()
    }
}
#endif
