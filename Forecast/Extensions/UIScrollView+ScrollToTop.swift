//
//  UIScrollView+ScrollToTop.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import UIKit

extension UIScrollView {
    func scrollToTop() {
        self.setContentOffset(.zero, animated: true)
    }
}
