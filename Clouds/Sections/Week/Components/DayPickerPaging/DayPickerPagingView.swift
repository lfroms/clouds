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
    internal typealias UIViewType = UICollectionView

    @Binding var items: [DateItem]
    @Binding var selection: Int

    func makeUIView(context: Context) -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout(collectionView: UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())))
        let layout = createLayout(collectionView: collectionView)
        collectionView.setCollectionViewLayout(layout, animated: false)

        collectionView.register(DateCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.decelerationRate = .normal
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.clipsToBounds = false
        collectionView.showsVerticalScrollIndicator = false

        let dataSource = UICollectionViewDiffableDataSource<Int, DateItem>(collectionView: collectionView) { (collectionView, indexPath, data) -> UICollectionViewCell? in
            // swiftlint:disable force_cast
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DateCell
            cell.data = DateItemViewModel(day: data.day, date: data.date)
            return cell
        }

        context.coordinator.dataSource = dataSource
        collectionView.dataSource = dataSource
        collectionView.delegate = context.coordinator

        return collectionView
    }

    func createLayout(collectionView: UICollectionView) -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (_: Int, _: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let itemWidth = Dimension.WeekSection.DayPicker.bubbleSize + Dimension.WeekSection.DayPicker.spacing
            let itemHeight = Dimension.WeekSection.DayPicker.bubbleSize

            let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(itemWidth), heightDimension: .absolute(itemHeight))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(itemWidth), heightDimension: .absolute(itemHeight))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPagingCentered

            section.visibleItemsInvalidationHandler = { visibleItems, offset, _ in
                let leadingMargin = Dimension.System.screenWidth / 2
                let page = Int((offset.x + leadingMargin) / itemWidth)
//                mainSectionDidScroll(page: page)

                guard
                    selection != page
                //            (0...items.count).contains(page)
                else {
                    return
                }

                feedbackGenerator.prepare()
                feedbackGenerator.selectionChanged()

                selection = page
                visibleItems.forEach { item in
                    guard let cell = collectionView.cellForItem(at: item.indexPath) as? DateCell else { return }
                    if item.frame.contains(.init(x: CGFloat(page) * itemWidth, y: 20)) {
                        cell.data?.active = true
                    } else {
                        cell.data?.active = false
                    }
                }
            }

            return section
        }

        return layout
    }

    private let feedbackGenerator = UISelectionFeedbackGenerator()

    func mainSectionDidScroll(page: Int) {
        guard
            selection != page
//            (0...items.count).contains(page)
        else {
            return
        }

        feedbackGenerator.prepare()
        feedbackGenerator.selectionChanged()

        selection = page
    }

    func updateUIView(_ uiView: UICollectionView, context: Context) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, DateItem>()
        snapshot.appendSections([0])
        snapshot.appendItems(items)

        context.coordinator.dataSource.apply(snapshot, animatingDifferences: false)
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

    final class Coordinator: NSObject, UICollectionViewDelegate {
        var dataSource: UICollectionViewDiffableDataSource<Int, DateItem>!
    }
}

extension DayPickerPagingView: Equatable {
    static func == (lhs: DayPickerPagingView, rhs: DayPickerPagingView) -> Bool {
        lhs.items == rhs.items
    }
}

private final class DateCell: UICollectionViewCell {
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

        contentView.addSubview(circleView)
        contentView.addSubview(activeCircleView)
        contentView.addSubview(innerView)

        contentView.clipsToBounds = false

        innerView.heightAnchor.constraint(equalToConstant: Dimension.WeekSection.DayPicker.bubbleSize).isActive = true
        innerView.widthAnchor.constraint(equalToConstant: Dimension.WeekSection.DayPicker.bubbleSize).isActive = true
        innerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        innerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        circleView.heightAnchor.constraint(equalToConstant: Dimension.WeekSection.DayPicker.bubbleSize).isActive = true
        circleView.widthAnchor.constraint(equalToConstant: Dimension.WeekSection.DayPicker.bubbleSize).isActive = true
        circleView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        circleView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        activeCircleView.heightAnchor.constraint(equalToConstant: Dimension.WeekSection.DayPicker.bubbleSize).isActive = true
        activeCircleView.widthAnchor.constraint(equalToConstant: Dimension.WeekSection.DayPicker.bubbleSize).isActive = true
        activeCircleView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        activeCircleView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
