//
//  IndicatorShape.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct IndicatorShape: View {
    let size: CGFloat
    let weight: CGFloat
    let color: Color

    var body: some View {
        return Circle()
            .trim(from: 0.25, to: 1)
            .stroke(color, lineWidth: weight)
            .frame(width: size, height: size)
    }
}

struct IndicatorShape_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorShape(size: 12, weight: 3, color: .white)
    }
}
