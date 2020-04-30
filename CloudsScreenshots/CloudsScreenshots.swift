//
//  CloudsScreenshots.swift
//  CloudsScreenshots
//
//  Created by Lukas Romsicki on 2020-04-30.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import XCTest

class CloudsScreenshots: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        super.setUp()

        continueAfterFailure = false

        app = XCUIApplication()

        setupSnapshot(app)
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
        super.tearDown()
    }

    func testNow() throws {}
}
