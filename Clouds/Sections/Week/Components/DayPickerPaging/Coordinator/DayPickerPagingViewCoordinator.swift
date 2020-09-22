//
//  DayPickerPagingViewCoordinator.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-09-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation
import UIKit

final class DayPickerPagingViewCoordinator: NSObject, UIScrollViewDelegate {
    private let parent: DayPickerPagingView
    private let feedbackGenerator = UISelectionFeedbackGenerator()

    var previousItems: [DayPickerPagingView.Item] = []

    init(_ parent: DayPickerPagingView) {
        self.parent = parent
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let targetPageIndex = indexOfPage(at: targetContentOffset.pointee.x, width: parent.pageSize, spacing: parent.spacing, in: scrollView)
        let newTargetOffset = offsetOfPage(at: targetPageIndex, width: parent.pageSize, spacing: parent.spacing, in: scrollView)

        targetContentOffset.pointee = CGPoint(x: newTargetOffset, y: 0)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let targetPageIndex = indexOfPage(at: scrollView.contentOffset.x, width: parent.pageSize, spacing: parent.spacing, in: scrollView)
        let maximumIndex = Int(scrollView.contentSize.width / parent.pageSize) - 1

        guard
            targetPageIndex != parent.selection,
            targetPageIndex >= 0,
            targetPageIndex < maximumIndex
        else {
            return
        }

        feedbackGenerator.prepare()
        feedbackGenerator.selectionChanged()

        parent.selection = targetPageIndex
    }

    private func indexOfPage(at offset: CGFloat, width: CGFloat, spacing: CGFloat, in scrollView: UIScrollView) -> Int {
        let pageWidth = width + spacing
        let offsetIncludingInset = offset + scrollView.contentInset.left
        return Int(round(offsetIncludingInset / pageWidth))
    }

    public func offsetOfPage(at index: Int, width: CGFloat, spacing: CGFloat, in scrollView: UIScrollView) -> CGFloat {
        let visibleWidth = scrollView.bounds.size.width - scrollView.contentInset.left - scrollView.contentInset.right
        let halfVisibleWidth = visibleWidth / 2

        let pageWidth = width + spacing
        let halfItemWidth = width / 2

        let offsetOfPage = CGFloat(index) * pageWidth

        return offsetOfPage - scrollView.contentInset.left + halfItemWidth - halfVisibleWidth
    }
}
