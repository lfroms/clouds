//
//  RadarControls.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-04-18.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct RadarControls: View {
    var loading: Bool
    var numberOfFrames: Int
    @Binding var playing: Bool
    @Binding var currentFrame: Int
    var currentDate: Date?

    var body: some View {
        HStack(alignment: .center, spacing: 14) {
            RadarPlayPauseButton(playing: $playing, loading: loading)
                .equatable()

            Slider(value: currentFrameBinding, in: 0...maximumFrame, step: 1, onEditingChanged: editingDidChange)
                .disabled(loading)

            if currentDate != nil {
                RadarCurrentDate(date: currentDate!)
                    .equatable()
            }
        }
    }

    private func editingDidChange(_ isEditing: Bool) {
        playing = false
    }

    private var maximumFrame: Double {
        guard numberOfFrames > 1 else {
            return 1
        }

        return Double(numberOfFrames - 1)
    }

    private var currentFrameBinding: Binding<Double> {
        Binding<Double>(get: {
            Double(self.currentFrame)
        }, set: {
            self.currentFrame = Int($0)
        })
    }
}

extension RadarControls: Equatable {
    static func == (lhs: RadarControls, rhs: RadarControls) -> Bool {
        lhs.loading == rhs.loading
            && lhs.playing == rhs.playing
            && lhs.numberOfFrames == rhs.numberOfFrames
            && lhs.currentDate == rhs.currentDate
    }
}

struct RadarControls_Previews: PreviewProvider {
    static var previews: some View {
        RadarControls(
            loading: false,
            numberOfFrames: 5,
            playing: .constant(false),
            currentFrame: .constant(2),
            currentDate: Date()
        )
    }
}
