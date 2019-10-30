//
//  RiseSetView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct RiseSetView: View {
    var body: some View {
        HStack(alignment: .lastTextBaseline, spacing: 5) {
            Image(systemName: "sunset.fill").padding(.bottom, 3)

            Text("18:20 EST")
        }
        .font(Font.subheadline.weight(.semibold))
        .foregroundColor(.secondary)
    }
}

struct RiseSetView_Previews: PreviewProvider {
    static var previews: some View {
        RiseSetView()
    }
}
