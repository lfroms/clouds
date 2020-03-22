//
//  DayPickerDateBubble.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-21.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DayPickerDateBubble: View, Equatable {
    var label: String
    var day: Int
    var active: Bool

    var body: some View {
        ZStack {
            background

            VStack(alignment: .center, spacing: 2) {
                Text(label)
                    .font(.caption)
                    .fontWeight(.bold)
                    .fixedSize()

                Text("\(day)")
                    .font(Font.system(size: 17, weight: .heavy, design: .default))
            }
            .foregroundColor(.white)
            .colorMultiply(active ? .black : .white)
            .animation(.easeInOut)
            .frame(width: Dimension.WeekSection.DayPicker.bubbleSize, height: Dimension.WeekSection.DayPicker.bubbleSize)
            .cornerRadius(Dimension.WeekSection.DayPicker.bubbleSize / 2)
            .background(ShadowView(radius: 0, opacity: 0.0, color: .clear, cornerRadius: 18))
        }
    }

    var background: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.white.opacity(0.14))

            if active {
                Circle()
                    .foregroundColor(Color.white)
                    .transition(.asymmetric(insertion: AnyTransition.scale(scale: 0.7).combined(with: AnyTransition.opacity.animation(.easeIn(duration: 0.2))).animation(.spring(response: 0.2, dampingFraction: 0.4)),
                                            removal: AnyTransition.opacity.animation(.easeInOut(duration: 0.16))))
            }
        }
    }
}

struct DayPickerDateBubble_Previews: PreviewProvider {
    static var previews: some View {
        DayPickerDateBubble(label: "Mon", day: 16, active: true)
    }
}
