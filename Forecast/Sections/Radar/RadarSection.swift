//
//  RadarSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct RadarSection: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            MapView()
            RadarControls()
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct RadarSection_Previews: PreviewProvider {
    static var previews: some View {
        RadarSection()
    }
}
