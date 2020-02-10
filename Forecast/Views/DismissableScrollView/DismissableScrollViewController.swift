//
//  DismissableScrollViewController.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI
import UIKit

class DismissableScrollViewController: UIViewController, UIScrollViewDelegate, HostableViewController, UIGestureRecognizerDelegate {
    lazy var hostingController: UIHostingController<AnyView> = {
        UIHostingController(rootView: AnyView(EmptyView()))
    }()

    var didPerformDismiss: (() -> Void)?

    private lazy var topInset: CGFloat = {
        (2 * Dimension.Header.padding) + Dimension.Header.omniBarHeight
    }()

    private lazy var scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.showsVerticalScrollIndicator = true
        v.showsHorizontalScrollIndicator = false
        v.alwaysBounceVertical = true
        v.alwaysBounceHorizontal = false
        v.isPagingEnabled = false
        v.clipsToBounds = false
        v.insetsLayoutMarginsFromSafeArea = false
        v.contentInsetAdjustmentBehavior = .never
        v.keyboardDismissMode = .onDrag
        v.scrollIndicatorInsets = UIEdgeInsets(top: self.topInset, left: 0, bottom: 0, right: 0)
        return v
    }()

    private lazy var panGestureRecognizer: UIPanGestureRecognizer = {
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(didPerformPanGesture(_:)))
        recognizer.delegate = self
        return recognizer
    }()

    private lazy var releaseInstructionLabel: UILabel = {
        let label = UILabel()
        label.text = "Release to Dismiss".uppercased()
        label.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        label.textAlignment = .center
        label.alpha = 0
        label.transform = self.initialReleaseLabelTransform

        return label
    }()

    private var releaseInstructionLabelBottomConstraint: NSLayoutConstraint?
    private let initialReleaseLabelTransform = CGAffineTransform(scaleX: 0.9, y: 0.9)

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addAndConfigureScrollView()

        self.hostingController.willMove(toParent: self)
        addChild(self.hostingController)

        self.scrollView.addSubview(self.hostingController.view)
        self.hostingController.view.pinEdges([.all], to: self.scrollView)
        self.hostingController.didMove(toParent: self)

        self.hostingController.view.backgroundColor = .clear

        self.addAndConfigureReleaseInstructionLabel()
    }

    private func addAndConfigureScrollView() {
        self.scrollView.delegate = self

        view.addSubview(self.scrollView)
        self.scrollView.pinEdges([.all], to: self.view)
        self.scrollView.contentInset.top = self.topInset

        self.scrollView.addGestureRecognizer(self.panGestureRecognizer)
    }

    private func addAndConfigureReleaseInstructionLabel() {
        view.addSubview(self.releaseInstructionLabel)

        self.releaseInstructionLabel.pinEdges([.leading, .trailing], to: self.view)
        let topConstraint = self.releaseInstructionLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.topInset)
        NSLayoutConstraint.activate([topConstraint])

        self.releaseInstructionLabelBottomConstraint = self.releaseInstructionLabel.heightAnchor.constraint(equalToConstant: 0)

        if let bottomConstraint = releaseInstructionLabelBottomConstraint {
            NSLayoutConstraint.activate([bottomConstraint])
        }
    }

    private var isAbleToDismiss: Bool = false {
        didSet(wasAbleToDismiss) {
            if !wasAbleToDismiss, wasAbleToDismiss != self.isAbleToDismiss {
                UISelectionFeedbackGenerator().selectionChanged()
            }
        }
    }

    @objc private func didPerformPanGesture(_ sender: UIPanGestureRecognizer) {
        guard self.scrollView.contentOffset.y <= 0 else {
            return
        }

        let panOffset = sender.translation(in: self.scrollView)
        self.isAbleToDismiss = panOffset.y > Dimension.LocationPicker.releaseToDismissThreshold

        self.animateReleaseInstructionLabelOpacity()

        guard self.isAbleToDismiss else {
            return
        }

        switch sender.state {
        case .changed:
            break

        case .ended, .cancelled:
            self.didPerformDismiss?()

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.releaseInstructionLabel.alpha = 0
            }

        default:
            break
        }
    }

    private func animateReleaseInstructionLabelOpacity() {
        let newAlpha: CGFloat = self.isAbleToDismiss ? 1 : 0
        let newTransform = self.isAbleToDismiss
            ? CGAffineTransform(scaleX: 1, y: 1)
            : self.initialReleaseLabelTransform

        guard
            newAlpha != self.releaseInstructionLabel.alpha
            || newTransform != self.releaseInstructionLabel.transform
        else {
            return
        }

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 20, options: .curveEaseInOut, animations: {
            self.releaseInstructionLabel.transform = newTransform
            self.releaseInstructionLabel.alpha = newAlpha
        })
    }

    internal func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    internal func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let verticalDelta = abs(scrollView.contentOffset.y) - self.topInset

        self.releaseInstructionLabelBottomConstraint?.constant = verticalDelta
    }
}
