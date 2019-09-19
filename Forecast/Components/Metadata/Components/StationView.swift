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
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(alignment: .lastTextBaseline, spacing: 8) {
                Image(systemName: "mappin.and.ellipse")
                Text(stationName)
            }
            .font(Font.system(size: 16).weight(.bold))
            .foregroundColor(Color.primary.opacity(0.75))
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .frame(minHeight: 35)
            .background(Color.primary.opacity(0.1))
            .cornerRadius(8)
        }
    }
}

#if DEBUG
struct StationView_Previews: PreviewProvider {
    static var previews: some View {
        StationView(stationName: "Ottawa (Kanata – Orléans)", action: {})
    }
}
#endif
