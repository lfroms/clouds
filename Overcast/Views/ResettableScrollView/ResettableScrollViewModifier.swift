//
//  ResettableScrollViewModifier.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-04-26.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ResettableScrollViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        ResettableScrollViewRepresentable(content: content)
    }
}
