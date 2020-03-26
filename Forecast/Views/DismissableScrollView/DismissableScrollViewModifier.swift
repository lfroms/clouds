//
//  ScrollView+OnDismiss.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DismissableScrollViewModifier: ViewModifier {
    let message: String
    let dismissAction: () -> Void

    init(message: String, dismissAction: @escaping () -> Void) {
        self.message = message
        self.dismissAction = dismissAction
    }

    func body(content: Content) -> some View {
        DismissableScrollViewRepresentable(message: message, dismissAction: dismissAction, content: content)
    }
}
