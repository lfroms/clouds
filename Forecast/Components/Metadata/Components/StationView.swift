//
//  StationView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-04.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct StationView: View {
    let stationName: String

    var body: some View {
        Text(stationName)
            .font(.system(size: 16))
            .fontWeight(.heavy)
            .opacity(0.75)
    }
}

#if DEBUG
struct StationView_Previews: PreviewProvider {
    static var previews: some View {
        StationView(stationName: "Ottawa (Kanata – Orléans)")
    }
}
#endif
