//
//  DismissableScrollViewHostingController.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

class DismissableScrollViewHostingController<Content>: UIHostingController<Content>, UIScrollViewDelegate, UIGestureRecognizerDelegate where Content: View {
    private var message: String
    private var dismissAction: () -> Void

    private var ready = false
    private var scrollView: UIScrollView?

    init(message: String, dismissAction: @escaping () -> Void, rootView: Content) {
        self.message = message
        self.dismissAction = dismissAction
        super.init(rootView: rootView)
    }

    @objc dynamic required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var panGestureRecognizer: UIPanGestureRecognizer = {
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(didPerformPanGesture(_:)))
        recognizer.delegate = self
        return recognizer
    }()

    private lazy var releaseLabel: UILabel = {
        let label = UILabel()
        label.text = message.uppercased()
        label.font = UIFont.preferredFont(for: .caption2, weight: .semibold)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.alpha = 0
        label.transform = self.initialReleaseLabelTransform

        return label
    }()

    private let initialReleaseLabelTransform = CGAffineTransform(scaleX: 0.8, y: 0.8)
    private var releaseLabelHeightConstraint: NSLayoutConstraint?

    override func viewDidAppear(_ animated: Bool) {
        guard !ready else {
            return
        }

        ready = true

        scrollView = findUIScrollView(view: view)
        scrollView?.delegate = self
        scrollView?.clipsToBounds = false
        scrollView?.keyboardDismissMode = .onDrag
        scrollView?.addGestureRecognizer(panGestureRecognizer)

        super.viewDidAppear(animated)
    }

    override func viewDidLayoutSubviews() {
        configureReleaseLabel()
    }

    private func configureReleaseLabel() {
        view.addSubview(releaseLabel)

        releaseLabel.pinEdges([.top, .leading, .trailing], to: view)

        guard releaseLabelHeightConstraint == nil else {
            return
        }

        releaseLabelHeightConstraint = releaseLabel.heightAnchor.constraint(equalToConstant: computedVerticalDelta)
        releaseLabelHeightConstraint?.isActive = true
    }

    @objc private func didPerformPanGesture(_ sender: UIPanGestureRecognizer) {
        guard let scrollView = scrollView, scrollView.contentOffset.y < 0 else {
            return
        }

        let panOffset = sender.translation(in: scrollView)
        isAbleToDismiss = panOffset.y > Dimension.LocationPicker.releaseToDismissThreshold

        animateChangeInReleaseEligibility()

        guard isAbleToDismiss else {
            return
        }

        switch sender.state {
        case .changed:
            break

        case .ended, .cancelled:
            releaseLabel.alpha = 0

            dismissAction()

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.scrollView?.alpha = 1
            }

        default:
            break
        }
    }

    private func findUIScrollView(view: UIView?) -> UIScrollView? {
        if view?.isKind(of: UIScrollView.self) ?? false {
            return (view as? UIScrollView)
        }

        for v in view?.subviews ?? [] {
            if let vc = findUIScrollView(view: v) {
                return vc
            }
        }

        return nil
    }

    private var isAbleToDismiss: Bool = false {
        didSet(wasAbleToDismiss) {
            if !wasAbleToDismiss, wasAbleToDismiss != isAbleToDismiss {
                UISelectionFeedbackGenerator().selectionChanged()
            }
        }
    }

    private func animateChangeInReleaseEligibility() {
        let newReleaseLabelAlpha: CGFloat = isAbleToDismiss ? 1 : 0

        let newTransform = isAbleToDismiss
            ? CGAffineTransform(scaleX: 1, y: 1)
            : initialReleaseLabelTransform

        let newContentAlpha: CGFloat = isAbleToDismiss ? 0.5 : 1

        guard
            newReleaseLabelAlpha != releaseLabel.alpha
            || newTransform != releaseLabel.transform
            || newContentAlpha != scrollView?.alpha
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
                self.scrollView?.alpha = newContentAlpha
            }
        }
    }

    private var computedVerticalDelta: CGFloat {
        guard let scrollView = scrollView else {
            return 0
        }

        return max(abs(scrollView.contentOffset.y) - scrollView.contentInset.top, 0)
    }

    // MARK: - UIGestureRecognizerDelegate

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    // MARK: - UIScrollViewDelegate

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        releaseLabelHeightConstraint?.constant = computedVerticalDelta
    }
}
