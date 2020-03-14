//
//  ScrollView+OnDismiss.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

extension ScrollView {
    func onDismiss(message: String, perform action: @escaping () -> Void) -> some View {
        return DismissableScrollViewWrapper(message: message, dismissAction: action) {
            self
        }
    }
}
