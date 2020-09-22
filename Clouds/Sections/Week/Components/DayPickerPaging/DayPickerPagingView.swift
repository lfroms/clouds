//
//  DayPickerPagingView.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI
import UIKit

struct DateItem: Hashable {
    let day: String
    let date: Int
}

struct DateItemViewModel {
    var day: String
    var date: Int
    var active: Bool = false
}

struct DayPickerPagingView: UIViewRepresentable {
    internal typealias UIViewType = UIScrollView

    @Binding var items: [DateItem]
    @Binding var selection: Int

    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceHorizontal = true
        scrollView.alwaysBounceVertical = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInset = makeContentInsets()
        scrollView.delegate = context.coordinator
        scrollView.decelerationRate = .fast
        return scrollView
    }

    private func makeContentInsets() -> UIEdgeInsets {
        let horizontalInset = (Dimension.System.screenWidth / 2) - (Dimension.WeekSection.DayPicker.bubbleSize / 2)
        return UIEdgeInsets(top: 0, left: horizontalInset, bottom: 0, right: horizontalInset)
    }

    func updateUIView(_ uiView: UIScrollView, context: Context) {
        uiView.subviews.forEach { $0.removeFromSuperview() }

        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = Dimension.WeekSection.DayPicker.spacing

        items.forEach {
            let item = DateCell()
            item.translatesAutoresizingMaskIntoConstraints = false
            item.data = DateItemViewModel(day: $0.day, date: $0.date)
            stack.addArrangedSubview(item)
        }

        uiView.addSubview(stack)

        stack.pinEdges(to: uiView)
        uiView.contentSize = stack.intrinsicContentSize
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    final class Coordinator: NSObject, UIScrollViewDelegate {
        private let parent: DayPickerPagingView

        init(_ parent: DayPickerPagingView) {
            self.parent = parent
        }

        func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            let pageWidth = Dimension.WeekSection.DayPicker.bubbleSize
            let spacing = Dimension.WeekSection.DayPicker.spacing

            let targetPageIndex = indexOfPage(at: targetContentOffset.pointee.x, width: pageWidth, spacing: spacing, in: scrollView)
            let newTargetOffset = offsetOfPage(at: targetPageIndex, width: pageWidth, spacing: spacing, in: scrollView)

            targetContentOffset.pointee = CGPoint(x: newTargetOffset, y: 0)
        }

        private func indexOfPage(at offset: CGFloat, width: CGFloat, spacing: CGFloat, in scrollView: UIScrollView) -> Int {
            let pageWidth = width + spacing
            let offsetIncludingInset = offset + scrollView.contentInset.left
            return Int(round(offsetIncludingInset / pageWidth))
        }

        private func offsetOfPage(at index: Int, width: CGFloat, spacing: CGFloat, in scrollView: UIScrollView) -> CGFloat {
            let visibleWidth = scrollView.bounds.size.width - scrollView.contentInset.left - scrollView.contentInset.right
            let halfVisibleWidth = visibleWidth / 2

            let pageWidth = width + spacing
            let halfItemWidth = width / 2

            let offsetOfPage = CGFloat(index) * pageWidth

            return offsetOfPage - scrollView.contentInset.left + halfItemWidth - halfVisibleWidth
        }
    }
}

extension DayPickerPagingView: Equatable {
    static func == (lhs: DayPickerPagingView, rhs: DayPickerPagingView) -> Bool {
        lhs.items == rhs.items
    }
}

private final class DateCell: UIView {
    var data: DateItemViewModel? {
        didSet {
            if let data = data {
                UIView.animate(withDuration: 0.2) {
                    self.topLabel.textColor = data.active ? .black : .white
                    self.bottomLabel.textColor = data.active ? .black : .white
                    self.activeCircleView.alpha = data.active ? 1 : 0
                }

                if data.active {
                    activeCircleView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
                    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1) {
                        self.activeCircleView.transform = CGAffineTransform(scaleX: 1, y: 1)
                    }
                }

                topLabel.text = data.day
                bottomLabel.text = String(data.date)
            }
        }
    }

    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .caption1).withWeight(.bold)
        label.textColor = .white

        return label
    }()

    private lazy var bottomLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body).withWeight(.black)
        label.textColor = .white

        return label
    }()

    private lazy var circleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 0.14)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = Dimension.WeekSection.DayPicker.bubbleSize / 2
        return view
    }()

    private lazy var activeCircleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0
        view.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = Dimension.WeekSection.DayPicker.bubbleSize / 2
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 2

        stack.addArrangedSubview(topLabel)
        stack.addArrangedSubview(bottomLabel)

        let innerView = UIView()
        innerView.translatesAutoresizingMaskIntoConstraints = false
        innerView.addSubview(stack)

        stack.pinEdges([.leading, .trailing], to: innerView, usingLayoutMargins: false)
        stack.centerYAnchor.constraint(equalTo: innerView.centerYAnchor).isActive = true

        addSubview(circleView)
        addSubview(activeCircleView)
        addSubview(innerView)

        clipsToBounds = false

        innerView.heightAnchor.constraint(equalToConstant: Dimension.WeekSection.DayPicker.bubbleSize).isActive = true
        innerView.widthAnchor.constraint(equalToConstant: Dimension.WeekSection.DayPicker.bubbleSize).isActive = true
        innerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        innerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        circleView.heightAnchor.constraint(equalToConstant: Dimension.WeekSection.DayPicker.bubbleSize).isActive = true
        circleView.widthAnchor.constraint(equalToConstant: Dimension.WeekSection.DayPicker.bubbleSize).isActive = true
        circleView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        circleView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        activeCircleView.heightAnchor.constraint(equalToConstant: Dimension.WeekSection.DayPicker.bubbleSize).isActive = true
        activeCircleView.widthAnchor.constraint(equalToConstant: Dimension.WeekSection.DayPicker.bubbleSize).isActive = true
        activeCircleView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activeCircleView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        widthAnchor.constraint(equalToConstant: Dimension.WeekSection.DayPicker.bubbleSize).isActive = true
        heightAnchor.constraint(equalToConstant: Dimension.WeekSection.DayPicker.bubbleSize).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
