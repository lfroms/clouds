//
//  DayPickerPagingViewCoordinator.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

final class DayPickerPagingViewCoordinator<Content: View>: NSObject, UIScrollViewDelegate {
    var parent: DayPickerPagingView<Content>

    private let feedbackGenerator = UISelectionFeedbackGenerator()

    init(_ parent: DayPickerPagingView<Content>) {
        self.parent = parent
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView.bounds.width > 0 else {
            // Prevent division by zero.
            return
        }

        let adjustedContentOffset = scrollView.contentOffset.x + parent.halfPageWidth

        var maximumIndex = Int(scrollView.contentSize.width / parent.pageWidth)
        if maximumIndex > 0 {
            maximumIndex -= 1
        }

        let isDragging = userIsDraggingScrollView(scrollView)

        if isDragging != parent.dragging {
            parent.dragging = isDragging
        }

        let newPage = Int(adjustedContentOffset / scrollView.bounds.size.width)

        guard
            newPage != parent.currentPage,
            scrollViewIsMoving(scrollView),
            (0...maximumIndex).contains(newPage)
        else {
            return
        }

        feedbackGenerator.prepare()
        feedbackGenerator.selectionChanged()

        parent.currentPage = newPage
    }

    func page(_ page: Int, scrollView: UIScrollView?) {
        guard let scrollView = scrollView, !scrollViewIsMoving(scrollView) else {
            return
        }

        let targetOffset = CGFloat(page) * parent.pageWidth
        let targetRect = CGRect(x: targetOffset, y: .zero, width: parent.pageWidth, height: parent.itemWidth)

        scrollView.scrollRectToVisible(targetRect, animated: true)
    }

    private func scrollViewIsMoving(_ scrollView: UIScrollView) -> Bool {
        scrollView.isTracking || scrollView.isDragging || scrollView.isDecelerating
    }

    private func userIsDraggingScrollView(_ scrollView: UIScrollView) -> Bool {
        scrollView.isDragging && scrollView.isTracking
    }
}
