//
//  MainPagingScrollViewController.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-08.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import CoreHaptics
import SwiftUI
import UIKit

final class MainPagingScrollViewController: UIViewController, UIScrollViewDelegate {
    var travelDistance: CGFloat = 0.0
    var isLocked: Bool = false {
        didSet {
            self.lockSettingDidChange()
        }
    }

    private let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.showsVerticalScrollIndicator = false
        v.showsHorizontalScrollIndicator = false
        v.alwaysBounceVertical = true
        v.alwaysBounceHorizontal = false
        v.isPagingEnabled = true
        v.clipsToBounds = false
        v.insetsLayoutMarginsFromSafeArea = false
        v.contentInsetAdjustmentBehavior = .never
        return v
    }()

    lazy var hostingController: UIHostingController<AnyView> = {
        UIHostingController(rootView: AnyView(EmptyView()))
    }()

    private var engine: CHHapticEngine?

    private lazy var hapticEvent: CHHapticEvent = {
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.36)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0)
        return CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initHapticEngine()

        self.addAndConfigureScrollView()

        self.hostingController.willMove(toParent: self)
        addChild(self.hostingController)

        self.scrollView.addSubview(self.hostingController.view)
        self.hostingController.view.pinEdges([.all], to: self.scrollView)
        self.hostingController.didMove(toParent: self)

        self.hostingController.view.backgroundColor = .clear
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.updateScrollViewContentHeight()
    }

    private func addAndConfigureScrollView() {
        self.scrollView.delegate = self

        view.addSubview(self.scrollView)
        self.scrollView.pinEdges([.all], to: self.view)
    }

    private func initHapticEngine() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        NotificationCenter.default.addObserver(
            forName: UIApplication.willEnterForegroundNotification,
            object: nil,
            queue: nil,
            using: self.startHapticEngine
        )

        do {
            self.engine = try CHHapticEngine()
            self.startHapticEngine()
        } catch {}

        self.engine?.resetHandler = { [weak self] in
            self?.startHapticEngine()
        }
    }

    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        guard !self.isOffsetBeyondPage(yContentOffset: scrollView.contentOffset.y) else { return }

        self.playThumpHaptic()
    }

    private func playThumpHaptic() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        do {
            let pattern = try CHHapticPattern(events: [self.hapticEvent], parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {}
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffset = self.scrollView.contentOffset.y
        scrollView.isPagingEnabled = !self.isOffsetBeyondPage(yContentOffset: contentOffset)
    }

    private func startHapticEngine(_ notification: Notification? = nil) {
        do {
            try self.engine?.start()
        } catch {}
    }

    private func isOffsetBeyondPage(yContentOffset: CGFloat) -> Bool {
        return yContentOffset >= self.travelDistance || yContentOffset <= 0
    }

    func updateScrollViewContentHeight() {
        let height = self.travelDistance + self.scrollView.frame.height
        self.scrollView.contentSize.height = height

        self.scrollView.setNeedsLayout()
    }

    private func lockSettingDidChange() {
        self.scrollView.isScrollEnabled = !self.isLocked
        self.scrollView.scrollToTop()
    }
}
