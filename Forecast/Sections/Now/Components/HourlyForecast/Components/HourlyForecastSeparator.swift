//
//  HourlyForecastSeparator.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-18.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HourlyForecastSeparator: View {
    var body: some View {
        Rectangle()
            .foregroundColor(AppColor.Control.extraSubdued)
            .frame(width: 0.5, height: 128)
    }
}

struct HourlyForecastSeparator_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastSeparator()
    }
}
