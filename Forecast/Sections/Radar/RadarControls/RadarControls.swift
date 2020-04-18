//
//  RadarControls.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftDate
import SwiftUI

struct RadarControls: View {
    @Binding var isPlaying: Bool
    var totalImages: Int
    var currentImage: Int
    var imageDate: Date?

    var body: some View {
        ZStack {
            BlurView(style: .light, tint: 0.5)
                .cornerRadius(12)

            HStack(alignment: .center, spacing: 16) {
                Button(action: { self.isPlaying.toggle() }) {
                    Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                        .font(Font.callout.weight(.semibold))
                        .frame(height: 50)
                }

                Text("Image \(currentImage + 1) of \(totalImages)")
                    .font(Font.callout.weight(.semibold))

                Spacer()

                Text(dateString)
                    .font(Font.subheadline.weight(.semibold))
                    .foregroundColor(AppColor.Display.secondary)
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 50)
        .padding([.horizontal, .bottom], 20)
    }

    private var dateString: String {
        guard let date = imageDate else {
            return .empty
        }

        return date.in(region: .current).toFormat("h:mm a")
    }
}

struct RadarControls_Previews: PreviewProvider {
    static var previews: some View {
        RadarControls(isPlaying: .constant(false), totalImages: 10, currentImage: 2, imageDate: Date())
    }
}
