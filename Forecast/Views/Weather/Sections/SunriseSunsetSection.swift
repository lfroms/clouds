//
//  SunriseSunsetSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SunriseSunsetSection: View {
    let viewModel: RiseSetViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            DetailBlockCollection(items: self.viewModel.items, rows: 1, spacing: 10)
                .padding(.horizontal, 18)
        }
    }
}

#if DEBUG
struct SunriseSunsetSection_Previews: PreviewProvider {
    static var previews: some View {
        SunriseSunsetSection(viewModel: .init(weather: nil))
    }
}
#endif
