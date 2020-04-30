//
//  DrawerScrollViewCoordinator.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-04-27.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CoreHaptics
import SwiftUI

final class DrawerScrollViewCoordinator<Content: View>: NSObject, UIScrollViewDelegate {
    @Binding private var isOpen: Bool
    @Binding private var travelDistance: CGFloat

    private var engine: CHHapticEngine?

    init(isOpen: Binding<Bool>, travelDistance: Binding<CGFloat>) {
        self._isOpen = isOpen
        self._travelDistance = travelDistance
        super.init()
        initHapticEngine()
    }

    private lazy var hapticEvent: CHHapticEvent = {
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.38)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0)
        return CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
    }()

    private func initHapticEngine() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        do {
            engine = try CHHapticEngine()
            startHapticEngine()
        } catch {}

        engine?.resetHandler = { [weak self] in
            self?.startHapticEngine()
        }
    }

    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        guard !isOffsetBeyondPage(yContentOffset: scrollView.contentOffset.y) else { return }

        playThumpHaptic()
    }

    private func playThumpHaptic() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        do {
            let pattern = try CHHapticPattern(events: [hapticEvent], parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {}
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.y
        scrollView.isPagingEnabled = !isOffsetBeyondPage(yContentOffset: contentOffset)

        let newOpenState = scrollView.contentOffset.y > travelDistance / 2

        if isOpen != newOpenState {
            isOpen = newOpenState
        }
    }

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startHapticEngine()
    }

    private func startHapticEngine() {
        do {
            try engine?.start()
        } catch {}
    }

    private func isOffsetBeyondPage(yContentOffset: CGFloat) -> Bool {
        return yContentOffset >= travelDistance || yContentOffset <= 0
    }
}
