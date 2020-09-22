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
            let item = DayPickerItemView(frame: CGRect(x: 0, y: 0, width: pageSize, height: pageSize), data: $0)
            stack.addArrangedSubview(item)
        }

        uiView.addSubview(stack)
        stack.pinEdges(to: uiView)
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    final class Coordinator: NSObject, UIScrollViewDelegate {
        private let parent: DayPickerPagingView
        private let feedbackGenerator = UISelectionFeedbackGenerator()

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
        lhs.items == rhs.items && lhs.selection == rhs.selection
    }
}

private final class DayPickerItemView: UIView {
    var data: DayPickerPagingView.Item {
        didSet {
            setTexts()
            animateChanges()
        }
    }

    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 2
        return view
    }()

    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

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

    private func animateChanges() {
        UIView.animate(withDuration: 0.2) { [self] in
            topLabel.textColor = data.active ? .black : .white
            bottomLabel.textColor = data.active ? .black : .white
            activeCircleView.alpha = data.active ? 1 : 0
        }

        if data.active {
            activeCircleView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1) {
                self.activeCircleView.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }
    }

    private func setTexts() {
        topLabel.text = data.day
        bottomLabel.text = String(data.date)
    }

    init(frame: CGRect, data: DayPickerPagingView.Item) {
        self.data = data

        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = false

        stackView.addArrangedSubview(topLabel)
        stackView.addArrangedSubview(bottomLabel)

        containerView.addSubview(stackView)

        addSubview(circleView)
        addSubview(activeCircleView)
        addSubview(containerView)

        configureConstraints()
        setTexts()
    }

    private func configureConstraints() {
        stackView.pinEdges([.leading, .trailing], to: containerView, usingLayoutMargins: false)
        stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true

        containerView.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        circleView.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        circleView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        circleView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        circleView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        activeCircleView.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        activeCircleView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        activeCircleView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activeCircleView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        widthAnchor.constraint(equalToConstant: frame.width).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
