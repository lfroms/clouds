//
//  DayPicker.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-21.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DayPicker: View {
    var days: [DayPickerItem]
    @Binding var activeIndex: Int

    var body: some View {
        HStack(spacing: Dimension.WeekSection.DayPicker.spacing) {
            if !days.isEmpty {
                ForEach(Array(self.days.enumerated()), id: \.element.date.day) { index, day in
                    Button(action: { self.activeIndex = index }) {
                        DayPickerDateBubble(label: day.date.weekdayName(.short), day: day.date.day, active: index == self.activeIndex)
                            .equatable()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .accessibility(identifier: "week.daypicker.datebubble")
                }
            }
        }
        // Add trailing space so that last page can be paginated to.
        .padding(.trailing, Dimension.WeekSection.DayPicker.spacing)
        .background(sizePreferenceKeyBackground)
        .overlay(todayText, alignment: .leading)
    }

    private var todayText: some View {
        let text = days.first?.hasDayConditions ?? true ? "Today" : "Tonight"

        return Text(text.uppercased())
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(Color.white.opacity(0.7))
            .padding(.trailing, 16)
            .alignmentGuide(.leading) { $0.width }
    }

    private var sizePreferenceKeyBackground: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: DayPickerContentSizePreferenceKey.self, value: geometry.size)
        }
    }
}

extension DayPicker: Equatable {
    static func == (lhs: DayPicker, rhs: DayPicker) -> Bool {
        lhs.days == rhs.days && lhs.activeIndex == rhs.activeIndex
    }
}

struct DayPicker_Previews: PreviewProvider {
    static var previews: some View {
        DayPicker(days: [], activeIndex: .constant(0))
    }
}
