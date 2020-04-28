//
//  UIScrollView+Clear.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-03-01.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import UIKit

extension UIScrollView {
    func clear() {
        subviews.forEach { subview in
            subview.removeFromSuperview()
        }
    }
}
