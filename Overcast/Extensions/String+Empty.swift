//
//  String+Empty.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-02-17.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation

extension String {
    public static var empty: String {
        ""
    }

    public mutating func clear() {
        removeAll()
    }
}
