//
//  DayPicker.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-21.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DayPicker: View {
    var days: [DailyForecastData]
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
                }
            }
        }
        // Add trailing space so that last page can be paginated to.
        .padding(.trailing, Dimension.WeekSection.DayPicker.spacing)
        .overlay(todayText, alignment: .leading)
    }

    private var todayText: some View {
        Text("Today".uppercased())
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(Color.white.opacity(0.7))
            .padding(.trailing, 16)
            .alignmentGuide(.leading) { $0.width }
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
