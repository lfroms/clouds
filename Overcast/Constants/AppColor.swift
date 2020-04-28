//
//  AppColor.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-03-14.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

public final class AppColor {
    public final class Display {
        public static let primary = Color.white
        public static let secondary = primary.opacity(0.7)
        public static let secondaryBright = primary.opacity(0.8)
        public static let placeholder = primary.opacity(0.3)
    }

    public final class Control {
        public static let subdued = Color.white.opacity(0.4)
        public static let extraSubdued = Color.white.opacity(0.15)
        public static let viewBackground = Color.black
    }
}
