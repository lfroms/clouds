//
//  BottomSafeAreaSpacer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct BottomSafeAreaSpacer: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(height: getBottonSafeMargin())
    }

    private func getBottonSafeMargin() -> CGFloat {
        guard let window = UIApplication.shared.windows.first else {
            return 0
        }

        return window.safeAreaInsets.bottom
    }
}

#if DEBUG
struct BottomSafeAreaSpacer_Previews: PreviewProvider {
    static var previews: some View {
        BottomSafeAreaSpacer()
    }
}
#endif
