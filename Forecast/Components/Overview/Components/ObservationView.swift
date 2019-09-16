//
//  ObservationView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-04.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ObservationView: View {
    var observation: String

    var body: some View {
        Text(observation)
            .font(.system(size: 20))
            .fontWeight(.bold)
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

#if DEBUG
struct ObservationView_Previews: PreviewProvider {
    static var previews: some View {
        ObservationView(observation: "Partly Cloudy")
    }
}
#endif
