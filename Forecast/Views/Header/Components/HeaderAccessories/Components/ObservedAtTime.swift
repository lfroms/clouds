//
//  ObservedAtTime.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ObservedAtTime: View, Equatable {
    @State private var text: String = .empty

    var loading: Bool
    var date: Date?
    var action: () -> Void

    private let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()

    var body: some View {
        HStack(alignment: .lastTextBaseline, spacing: 5) {
            if loading {
                AppActivityIndicator(color: AppColor.Display.secondaryBright)
                    .equatable()

            } else {
                Image(systemName: SFSymbol.clockFilled)
                    .equatable()
            }

            Button(action: action) {
                Text(text)
                    .equatable()
            }
        }
        .font(Font.subheadline.weight(.semibold))
        .onReceive(timer) { _ in
            self.updateText()
        }
    }

    private func updateText() {
        self.text = self.date?.timeAgo(relativeTo: Date()) ?? .empty
    }

    // MARK: - Equatable

    static func == (lhs: ObservedAtTime, rhs: ObservedAtTime) -> Bool {
        lhs.loading == rhs.loading && lhs.date == rhs.date
    }
}

struct ObservedAtTime_Previews: PreviewProvider {
    static var previews: some View {
        ObservedAtTime(
            loading: false,
            date: Date(),
            action: {}
        )
    }
}
