//
//  RadarPlayPauseButton.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-04-18.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct RadarPlayPauseButton: View {
    @Binding var playing: Bool
    var loading: Bool

    var body: some View {
        Button(action: didPressButton) {
            ZStack(alignment: .center) {
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 48, height: 48)

                if loading {
                    AppActivityIndicator(style: .light)
                        .equatable()
                } else {
                    Image(systemName: self.icon)
                        .font(Font.system(size: 18).weight(.semibold))
                        .foregroundColor(.black)
                        .padding(.leading, playing ? 0 : 2)
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
        .disabled(loading)
    }

    private var icon: String {
        playing ? SFSymbol.pauseFilled : SFSymbol.playFilled
    }

    private func didPressButton() {
        playing.toggle()
    }
}

extension RadarPlayPauseButton: Equatable {
    static func == (lhs: RadarPlayPauseButton, rhs: RadarPlayPauseButton) -> Bool {
        lhs.playing == rhs.playing && lhs.loading == rhs.loading
    }
}

struct RadarPlayPauseButton_Previews: PreviewProvider {
    static var previews: some View {
        RadarPlayPauseButton(playing: .constant(false), loading: false)
    }
}
