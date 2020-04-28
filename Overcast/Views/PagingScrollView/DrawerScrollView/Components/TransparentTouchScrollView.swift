//
//  TransparentTouchScrollView.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-02-10.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import UIKit

class TransparentTouchScrollView: UIScrollView {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return self.subviews.first?.bounds.contains(point) ?? false
    }
}
