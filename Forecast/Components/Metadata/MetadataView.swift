//
//  MetadataView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-04.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct MetadataView: View {
    let timestamp: Date
    let stationName: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            TimestampView(date: timestamp)
            StationView(stationName: stationName)
        }
    }
}

#if DEBUG
struct MetadataView_Previews: PreviewProvider {
    static var previews: some View {
        MetadataView(timestamp: Date(), stationName: "Ottawa (Kanata – Orléans)")
    }
}
#endif
