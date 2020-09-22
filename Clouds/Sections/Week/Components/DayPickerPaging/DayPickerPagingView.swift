//
//  DayPickerPagingView.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI
import UIKit

final class CancellableTouchScrollView: UIScrollView {
    override func touchesShouldCancel(in view: UIView) -> Bool {
        return true
    }
}

struct DayPickerPagingView: UIViewRepresentable {
    internal typealias UIViewType = UIScrollView

    let pageSize: CGFloat
    let spacing: CGFloat
    let items: [Item]
    let leadingLabelText: String

    @Binding var selection: Int

    let didSelectItemWithIndex: (_: Int) -> Void

    struct Item: Equatable {
        let day: String
        let date: Int
        var active: Bool = false
    }

    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = CancellableTouchScrollView()
        scrollView.alwaysBounceHorizontal = true
        scrollView.alwaysBounceVertical = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInset = makeContentInsets()
        scrollView.clipsToBounds = false
        scrollView.delegate = context.coordinator
        scrollView.decelerationRate = .fast
        scrollView.delaysContentTouches = false

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = spacing

        scrollView.addSubview(stackView)
        stackView.pinEdges(to: scrollView)

        let leadingLabel = UILabel()
        leadingLabel.font = UIFont.preferredFont(forTextStyle: .caption1).withWeight(.bold)
        leadingLabel.textColor = UIColor(white: 1, alpha: 0.7)
        leadingLabel.text = leadingLabelText.uppercased()
        leadingLabel.textAlignment = .right
        leadingLabel.translatesAutoresizingMaskIntoConstraints = false

        scrollView.addSubview(leadingLabel)
        leadingLabel.trailingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -16).isActive = true
        leadingLabel.centerYAnchor.constraint(equalTo: stackView.centerYAnchor).isActive = true

        return scrollView
    }

    private func makeContentInsets() -> UIEdgeInsets {
        let horizontalInset = (Dimension.System.screenWidth / 2) - (Dimension.WeekSection.DayPicker.bubbleSize / 2)
        return UIEdgeInsets(top: 0, left: horizontalInset, bottom: 0, right: horizontalInset)
    }

    private func stackView(in scrollView: UIScrollView) -> UIStackView? {
        return scrollView.subviews.first as? UIStackView
    }

    private func leadingLabel(in scrollView: UIScrollView) -> UILabel? {
        return scrollView.subviews.last as? UILabel
    }

    private func dayPickerItemViews(in stackView: UIStackView) -> [DayPickerItemView]? {
        return stackView.subviews as? [DayPickerItemView]
    }

    func updateUIView(_ uiView: UIScrollView, context: Context) {
        guard let stackView = stackView(in: uiView) else {
            return
        }

        markActiveView(stackView: stackView)
        renderItems(stackView: stackView, context: context)
        leadingLabel(in: uiView)?.text = leadingLabelText.uppercased()

        if !uiView.isTracking, !uiView.isDecelerating {
            scrollToActiveView(scrollView: uiView, stackView: stackView, context: context)
        }
    }

    private func markActiveView(stackView: UIStackView) {
        guard let dayPickerItemViews = dayPickerItemViews(in: stackView) else {
            return
        }

        dayPickerItemViews.enumerated().forEach { index, view in
            view.data.active = index == selection
        }
    }

    private func renderItems(stackView: UIStackView, context: Context) {
        guard context.coordinator.previousItems != items else {
            return
        }

        context.coordinator.previousItems = items
        stackView.clear()

        items.enumerated().forEach { index, data in
            let item = DayPickerItemView(frame: CGRect(x: 0, y: 0, width: pageSize, height: pageSize), data: data) {
                didSelectItemWithIndex(index)
            }

            stackView.addArrangedSubview(item)
        }
    }

    private func scrollToActiveView(scrollView: UIScrollView, stackView: UIStackView, context: Context) {
        if let targetFrame = dayPickerItemViews(in: stackView)?[safe: selection]?.frame {
            scrollView.scrollRectToVisible(targetFrame, animated: true)
        }
    }

    func makeCoordinator() -> DayPickerPagingViewCoordinator {
        return DayPickerPagingViewCoordinator(self)
    }
}

extension DayPickerPagingView: Equatable {
    static func == (lhs: DayPickerPagingView, rhs: DayPickerPagingView) -> Bool {
        lhs.items == rhs.items
            && lhs.selection == rhs.selection
            && lhs.leadingLabelText == rhs.leadingLabelText
    }
}
