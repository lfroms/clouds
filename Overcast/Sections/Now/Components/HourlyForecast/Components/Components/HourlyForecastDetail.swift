//
//  HourlyForecastDetail.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2019-09-18.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HourlyForecastDetail: View {
    let iconName: String
    let label: String

    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            Image(systemName: iconName).font(.system(size: 13, weight: .bold))
            Text(label)
                .font(.caption)
                .fontWeight(.bold)
        }
    }
}

struct HourlyForecastDetail_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastDetail(iconName: "umbrella.fill", label: "Low")
    }
}
