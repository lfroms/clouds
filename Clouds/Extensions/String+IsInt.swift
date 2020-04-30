//
//  String+IsInt.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-09-18.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Foundation

extension String {
    var isInt: Bool {
        Int(self) != nil
    }
}
