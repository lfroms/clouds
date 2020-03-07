//
//  TouchPassthroughView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-08.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import UIKit

final class TouchPassthroughView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let child = super.hitTest(point, with: event)

        if child == self, subviews.count > 0 {
            return subviews[0]
        }

        return child
    }
}
