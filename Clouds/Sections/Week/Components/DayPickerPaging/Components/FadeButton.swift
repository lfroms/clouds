//
//  FadeButton.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-09-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation
import UIKit

final class FadeButton: UIButton {
    override var isHighlighted: Bool {
        didSet {
            guard oldValue != self.isHighlighted else { return }

            UIView.animate(withDuration: 0.15, delay: 0, options: [.beginFromCurrentState, .allowUserInteraction], animations: {
                self.alpha = self.isHighlighted ? 0.5 : 1
            }, completion: nil)
        }
    }
}
