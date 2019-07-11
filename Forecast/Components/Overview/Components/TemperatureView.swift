//
//  TemperatureView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-04.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TemperatureView: View {
    var value: Int

    var body: some View {
        Text("\(value)°")
            .font(.system(size: 72))
            .fontWeight(.heavy)
            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
    }
}

#if DEBUG
struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView(value: 10)
    }
}
#endif
