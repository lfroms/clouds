//
//  NowSection.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftDate
import SwiftUI

struct NowSection: View {
    var body: some View {
        VStack(spacing: 32) {
            OverviewViewContainer()
                .padding(.horizontal, 36)

            HourlyForecastContainer()
        }
    }
}

struct NowTab_Previews: PreviewProvider {
    static var previews: some View {
        NowSection()
    }
}
