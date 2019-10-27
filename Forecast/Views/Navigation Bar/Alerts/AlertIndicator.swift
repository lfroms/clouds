//
//  AlertIndicator.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AlertIndicator: View {
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .foregroundColor(.red)
                .frame(width: 38, height: 38)

            Image(systemName: "exclamationmark.triangle.fill")
                .font(Font.callout.bold())
                .foregroundColor(.white)
        }
    }
}

struct AlertIndicator_Previews: PreviewProvider {
    static var previews: some View {
        AlertIndicator()
    }
}
