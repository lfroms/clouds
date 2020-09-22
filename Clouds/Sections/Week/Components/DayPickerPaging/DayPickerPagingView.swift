//
//  DayPickerPagingView.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI
import UIKit

struct DayPickerPagingView: UIViewRepresentable {
    internal typealias UIViewType = UIScrollView

    let pageSize: CGFloat
    let spacing: CGFloat
    let items: [Item]

    @Binding var selection: Int

    struct Item: Equatable {
        let day: String
        let date: Int
        var active: Bool = false
    }

    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceHorizontal = true
        scrollView.alwaysBounceVertical = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInset = makeContentInsets()
        scrollView.clipsToBounds = false
        scrollView.delegate = context.coordinator
        scrollView.decelerationRate = .fast

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = spacing

        scrollView.addSubview(stackView)
        stackView.pinEdges(to: scrollView)

        return scrollView
    }

    private func makeContentInsets() -> UIEdgeInsets {
        let horizontalInset = (Dimension.System.screenWidth / 2) - (Dimension.WeekSection.DayPicker.bubbleSize / 2)
        return UIEdgeInsets(top: 0, left: horizontalInset, bottom: 0, right: horizontalInset)
    }

    private func stackView(in scrollView: UIScrollView) -> UIStackView? {
        return scrollView.subviews.first as? UIStackView
    }

    private func dayPickerItemViews(in stackView: UIStackView) -> [DayPickerItemView]? {
        return stackView.subviews as? [DayPickerItemView]
    }

    func updateUIView(_ uiView: UIScrollView, context: Context) {
        guard let stackView = stackView(in: uiView) else {
            return
        }

        markActiveView(stackView: stackView)

        if !uiView.isTracking, !uiView.isDecelerating {
            scrollToActiveView(scrollView: uiView, context: context)
        }

        guard context.coordinator.previousItems != items else {
            return
        }

        context.coordinator.previousItems = items
        stackView.clear()

        items.forEach {
            let item = DayPickerItemView(frame: CGRect(x: 0, y: 0, width: pageSize, height: pageSize), data: $0)
            stackView.addArrangedSubview(item)
        }
    }

    private func markActiveView(stackView: UIStackView) {
        if let dayPickerItemViews = dayPickerItemViews(in: stackView) {
            dayPickerItemViews.enumerated().forEach { index, view in
                view.data.active = index == selection
            }
        }
    }

    private func scrollToActiveView(scrollView: UIScrollView, context: Context) {
        let offsetOfPage = context.coordinator.offsetOfPage(at: selection, width: pageSize, spacing: spacing, in: scrollView)
        scrollView.scrollRectToVisible(CGRect(x: offsetOfPage, y: 0, width: pageSize, height: pageSize), animated: false)
    }

    func makeCoordinator() -> DayPickerPagingViewCoordinator {
        return DayPickerPagingViewCoordinator(self)
    }
}

extension DayPickerPagingView: Equatable {
    static func == (lhs: DayPickerPagingView, rhs: DayPickerPagingView) -> Bool {
        lhs.items == rhs.items && lhs.selection == rhs.selection
    }
}
