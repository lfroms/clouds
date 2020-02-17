//
//  DismissableScrollViewController.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import UIKit

class DismissableScrollViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {
    var releaseToDismissText: String {
        set { self.releaseLabel.text = newValue.uppercased() }
        get { self.releaseLabel.text ?? "" }
    }

    var didPerformDismiss: (() -> Void)?

    private(set) lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        return scrollView
    }()

    private lazy var panGestureRecognizer: UIPanGestureRecognizer = {
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(didPerformPanGesture(_:)))
        recognizer.delegate = self
        return recognizer
    }()

    private lazy var releaseLabel: UILabel = {
        let label = UILabel()
        label.text = "Release to Dismiss".uppercased()
        label.font = UIFont.preferredFont(for: .caption2, weight: .semibold)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.alpha = 0
        label.transform = self.initialReleaseLabelTransform

        return label
    }()

    private let initialReleaseLabelTransform = CGAffineTransform(scaleX: 0.8, y: 0.8)
    private var releaseLabelHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureScrollView()
        self.configureReleaseLabel()
    }

    private func configureScrollView() {
        view.addSubview(self.scrollView)
        self.scrollView.pinEdges(to: view)
        self.scrollView.addGestureRecognizer(self.panGestureRecognizer)
    }

    private func configureReleaseLabel() {
        view.addSubview(self.releaseLabel)

        self.releaseLabel.pinEdges([.leading, .trailing], to: view)

        self.releaseLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: self.scrollView.contentInset.top).isActive = true

        self.releaseLabelHeightConstraint = self.releaseLabel.heightAnchor.constraint(equalToConstant: self.computedVerticalDelta)
        self.releaseLabelHeightConstraint.isActive = true
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

        self.animateChangeInReleaseEligibility()

        guard self.isAbleToDismiss else {
            return
        }

        switch sender.state {
        case .changed:
            break

        case .ended, .cancelled:
            self.didPerformDismiss?()

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.releaseLabel.alpha = 0
                self.scrollView.alpha = 1
            }

        default:
            break
        }
    }

    private func animateChangeInReleaseEligibility() {
        let newReleaseLabelAlpha: CGFloat = self.isAbleToDismiss ? 1 : 0

        let newTransform = self.isAbleToDismiss
            ? CGAffineTransform(scaleX: 1, y: 1)
            : self.initialReleaseLabelTransform

        let newContentAlpha: CGFloat = self.isAbleToDismiss ? 0.5 : 1

        guard
            newReleaseLabelAlpha != self.releaseLabel.alpha
            || newTransform != self.releaseLabel.transform
            || newContentAlpha != self.scrollView.alpha
        else {
            return
        }

        DispatchQueue.main.async {
            UIViewPropertyAnimator(duration: 0.6, dampingRatio: 0.4) {
                self.releaseLabel.transform = newTransform
            }.startAnimation()
        }

        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.2) {
                self.releaseLabel.alpha = newReleaseLabelAlpha
                self.scrollView.alpha = newContentAlpha
            }
        }
    }

    internal func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    internal func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.releaseLabelHeightConstraint?.constant = self.computedVerticalDelta
    }

    private var computedVerticalDelta: CGFloat {
        max(abs(self.scrollView.contentOffset.y) - self.scrollView.contentInset.top, 0)
    }
}
