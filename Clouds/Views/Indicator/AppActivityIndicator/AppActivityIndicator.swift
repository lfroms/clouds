//
//  AppActivityIndicator.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-11-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AppActivityIndicator: View {
    var style: Style = .light

    enum Style {
        case light
        case dark
    }

    var body: some View {
        CustomSpinner(isWhite: style == .dark)
            .frame(width: 12, height: 12)
    }
}

extension AppActivityIndicator: Equatable {
    static func == (lhs: AppActivityIndicator, rhs: AppActivityIndicator) -> Bool {
        lhs.style == rhs.style
    }
}

struct AppActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        AppActivityIndicator()
    }
}
