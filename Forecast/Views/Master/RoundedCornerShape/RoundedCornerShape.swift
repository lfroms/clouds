//
//  RoundedCornerShape.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct RoundedCornerShape: Shape {
    var cornerRadius: CGFloat
    var style: RoundedCornerStyle
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}

struct RoundedCornerShape_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCornerShape(cornerRadius: 20, style: .circular, corners: [.bottomLeft, .bottomRight])
    }
}
