//
//  DayPickerPagingViewContainer.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-03-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DayPickerPagingViewContainer: Container {
    @EnvironmentObject private var weekSectionState: WeekSectionState
    @State private var size: CGSize = .zero

    var body: some View {
        DayPickerPagingView(
            pageWidth: Dimension.WeekSection.DayPicker.bubbleSize,
            spacing: Dimension.WeekSection.DayPicker.spacing,
            currentPage: $weekSectionState.dayIndex,
            size: size
        ) {
            DayPickerContainer()
        }
        .equatable()
        .onPreferenceChange(DayPickerContentSizePreferenceKey.self, perform: contentSizePreferenceDidChange)
    }

    private func contentSizePreferenceDidChange(_ preference: CGSize) {
        guard preference != size else {
            return
        }

        size = preference
    }
}

struct DayPickerPagingViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        DayPickerPagingViewContainer()
    }
}
