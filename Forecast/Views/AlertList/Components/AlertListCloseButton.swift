//
//  AlertListCloseButton.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-04-26.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AlertListCloseButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: SFSymbol.xMark)
                .foregroundColor(Color.white.opacity(0.8))
                .font(Font.system(size: 14).weight(.bold))
                .frame(width: 37, height: 37, alignment: .center)
                .background(Color.white.opacity(0.25))
                .cornerRadius(.infinity)
        }
    }
}

extension AlertListCloseButton: Equatable {
    static func == (lhs: AlertListCloseButton, rhs: AlertListCloseButton) -> Bool {
        false
    }
}

struct AlertListCloseButton_Previews: PreviewProvider {
    static var previews: some View {
        AlertListCloseButton(action: {})
    }
}
