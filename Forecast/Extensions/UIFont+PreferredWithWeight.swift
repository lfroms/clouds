//
//  UIFont+PreferredWithWeight.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-10.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import UIKit

extension UIFont {
    static func preferredFont(for style: TextStyle, weight: Weight) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: style)
        let desc = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
        let font = UIFont.systemFont(ofSize: desc.pointSize, weight: weight)
        return metrics.scaledFont(for: font)
    }
}
