//
//  DayPickerDateBubble.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-03-21.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DayPickerDateBubble: View {
    var label: String
    var day: Int
    var active: Bool

    var body: some View {
        VStack(alignment: .center, spacing: 2) {
            Text(label)
                .font(.caption)
                .fontWeight(.bold)
                .fixedSize()

            Text("\(day)")
                .font(.body)
                .fontWeight(.heavy)
        }
        .foregroundColor(.white)
        .colorMultiply(active ? .black : .white)
        .animation(.easeInOut)
        .frame(width: Dimension.WeekSection.DayPicker.bubbleSize, height: Dimension.WeekSection.DayPicker.bubbleSize)
        .background(background)
    }

    private var background: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.white.opacity(0.14))

            if active {
                Circle()
                    .foregroundColor(Color.white)
                    .transition(.asymmetric(insertion: insertionTransition, removal: removalTransition))
            }
        }
    }

    private var insertionTransition: AnyTransition {
        AnyTransition
            .scale(scale: 0.6)
            .combined(
                with: AnyTransition
                    .opacity
                    .animation(.easeIn(duration: 0.2))
            )
            .animation(.spring(response: 0.3, dampingFraction: 0.6))
    }

    private var removalTransition: AnyTransition {
        AnyTransition.opacity.animation(.easeInOut(duration: 0.16))
    }
}

extension DayPickerDateBubble: Equatable {
    static func == (lhs: DayPickerDateBubble, rhs: DayPickerDateBubble) -> Bool {
        lhs.label == rhs.label
            && lhs.day == rhs.day
            && lhs.active == rhs.active
    }
}

struct DayPickerDateBubble_Previews: PreviewProvider {
    static var previews: some View {
        DayPickerDateBubble(label: "Mon", day: 16, active: true)
    }
}
