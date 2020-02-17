//
//  RadarControls.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct RadarControls: View {
    @Binding var isPlaying: Bool
    var totalImages: Int
    @Binding var currentImage: Int

    var body: some View {
        ZStack {
            BlurView(style: .light, tint: 0.5)
                .cornerRadius(12)

            HStack(alignment: .center, spacing: 16) {
                Button(action: { self.isPlaying.toggle() }) {
                    Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                        .font(Font.callout.weight(.semibold))
                        .foregroundColor(.primary)
                }

                Text("Image \(currentImage + 1) of \(totalImages)")
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
        RadarControls(isPlaying: .constant(false), totalImages: 10, currentImage: .constant(2))
    }
}
