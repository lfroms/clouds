//
//  ForecastWeatherIcon.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ForecastWeatherIcon: View {
    let name: String

    var body: some View {
        Image(systemName: name)
            .font(.system(size: 24))
    }
}

#if DEBUG
struct ForecastWeatherIcon_Previews: PreviewProvider {
    static var previews: some View {
        ForecastWeatherIcon(name: "cloud.rain.fill")
    }
}
#endif
