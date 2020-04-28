//
//  RadarCurrentDate.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-04-18.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct RadarCurrentDate: View {
    var date: Date

    var body: some View {
        Text(humanReadableDate)
            .font(Font.subheadline.monospacedDigit())
            .fontWeight(.bold)
            .foregroundColor(.white)
    }

    private var humanReadableDate: String {
        date.in(region: .current).toFormat("h:mm a")
    }
}

extension RadarCurrentDate: Equatable {}

struct RadarCurrentDate_Previews: PreviewProvider {
    static var previews: some View {
        RadarCurrentDate(date: Date())
    }
}
