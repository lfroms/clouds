//
//  AppEnvironment.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-05-01.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation

final class AppEnvironment {
    static var isUITesting: Bool {
        ProcessInfo.processInfo.arguments.contains("UI_TESTING")
    }
}
