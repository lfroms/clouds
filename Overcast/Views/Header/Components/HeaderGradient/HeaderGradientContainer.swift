//
//  HeaderGradientContainer.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-03-02.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct HeaderGradientContainer: Container {
    @EnvironmentObject private var locationPickerState: LocationPickerState

    var body: some View {
        HeaderGradient(style: locationPickerState.presented ? .prominent : .normal)
            .equatable()
    }
}

struct HeaderGradientContainer_Previews: PreviewProvider {
    static var previews: some View {
        HeaderGradientContainer()
    }
}
