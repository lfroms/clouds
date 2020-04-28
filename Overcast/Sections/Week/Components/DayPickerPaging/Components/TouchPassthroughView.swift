//
//  TouchPassthroughView.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-03-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
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
