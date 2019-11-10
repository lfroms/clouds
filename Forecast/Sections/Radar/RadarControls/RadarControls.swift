//
//  RadarControls.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct RadarControls: View {
    var body: some View {
        ZStack {
            BlurView(style: .light, tint: 0.5)
                .cornerRadius(12)

            HStack(alignment: .center, spacing: 16) {
                Image(systemName: "play.fill")
                    .font(Font.callout.weight(.semibold))

                Text("Image 2 of 10")
                    .font(Font.callout.weight(.semibold))

                Spacer()

                Text("2:30 PM")
                    .font(Font.subheadline.weight(.semibold))
                    .foregroundColor(.secondary)
            }
            .padding(16)
        }
        .frame(height: 50)
        .padding([.horizontal, .bottom], 20)
    }
}

struct RadarControls_Previews: PreviewProvider {
    static var previews: some View {
        RadarControls()
    }
}
