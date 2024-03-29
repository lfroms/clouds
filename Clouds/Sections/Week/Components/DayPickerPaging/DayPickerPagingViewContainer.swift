//
//  DayPickerPagingViewContainer.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DayPickerPagingViewContainer: Container {
    @EnvironmentObject private var weekSectionState: WeekSectionState
    @EnvironmentObject private var weatherService: WeatherService
    @State private var size: CGSize = .zero

    var body: some View {
        DayPickerPagingView(
            pageSize: Dimension.WeekSection.DayPicker.bubbleSize,
            spacing: Dimension.WeekSection.DayPicker.spacing,
            items: dates,
            leadingLabelText: leadingLabelText,
            selection: $weekSectionState.dayIndex,
            dragging: $weekSectionState.dragging,
            didSelectItemWithIndex: didSelectItemWithIndex(index:)
        )
        .equatable()
    }

    private func didSelectItemWithIndex(index: Int) {
        weekSectionState.dayIndex = index
    }

    private var leadingLabelText: String {
        guard let days = weatherService.weather?.daily else {
            return .empty
        }

        return days.first?.daytimeConditions != nil ? "Today" : "Tonight"
    }

    private var dates: [DayPickerPagingView.Item] {
        guard let days = weatherService.weather?.daily else {
            return []
        }

        return days.compactMap { day in
            let date = Date(seconds: Double(day.time), region: .UTC).date

            return DayPickerPagingView.Item(day: date.weekdayName(.short), date: date.day)
        }
    }
}

struct DayPickerPagingViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        DayPickerPagingViewContainer()
    }
}
