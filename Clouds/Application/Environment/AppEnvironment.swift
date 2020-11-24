//
//  AppEnvironment.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-05-01.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation

final class AppEnvironment {
    private static var secrets: NSDictionary? {
        guard let filePath = Bundle.main.path(forResource: "Secrets", ofType: "plist") else {
            return NSDictionary()
        }

        return NSDictionary(contentsOfFile: filePath)
    }

    static var isUITesting: Bool {
        ProcessInfo.processInfo.arguments.contains("UI_TESTING")
    }

    static var development: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }

    static var production: Bool {
        !development
    }

    static var appCenterApiKey: String? {
        secrets?.object(forKey: "AppCenterKey") as? String
    }

    static var bugsnagApiKey: String? {
        secrets?.object(forKey: "BugsnagKey") as? String
    }
}
