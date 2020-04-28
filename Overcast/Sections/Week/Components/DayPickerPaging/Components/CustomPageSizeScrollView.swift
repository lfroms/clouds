//
//  CustomPageSizeScrollView.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-03-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import UIKit

class CustomPageSizeScrollView: UIScrollView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        var view = super.hitTest(point, with: event)

        subviews.forEach { subview in
            if view != nil, view!.isUserInteractionEnabled {
                return
            }

            let newPoint = convert(point, to: subview)
            view = subview.hitTest(newPoint, with: event)
        }

        return view
    }
}
