//
//  DismissableScrollViewWrapper.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DismissableScrollViewWrapper<Content: View>: View {
    let message: String
    let dismissAction: () -> Void
    let content: () -> Content

    init(message: String, dismissAction: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
        self.message = message
        self.dismissAction = dismissAction
        self.content = content
    }

    var body: some View {
        DismissableScrollViewRepresentable(message: message, dismissAction: dismissAction, content: self.content())
    }
}
