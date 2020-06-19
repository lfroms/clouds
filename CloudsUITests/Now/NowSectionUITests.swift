//
//  NowSectionUITests.swift
//  CloudsUITests
//
//  Created by Lukas Romsicki on 2020-06-18.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import XCTest

class NowSectionUITests: XCTestCase {
    var app: XCUIApplication!

    let stubs = DynamicStubs()

    override func setUpWithError() throws {
        super.setUp()

        continueAfterFailure = false

        app = XCUIApplication()
        app.launchArguments += ["UI_TESTING"]

        try! stubs.server.start()

        addUIInterruptionMonitor(withDescription: "Allow “Clouds” to use your location?") { element in
            element.buttons["Allow While Using App"].tap()
            return true
        }
    }

    override func tearDownWithError() throws {
        app = nil
        stubs.server.stop()
        super.tearDown()
    }

    func testMasterViewIsVisible() throws {
        stubs.stubRequest(path: "/graphql", jsonData: WeatherFixtureJSON().jsonData!)
        launchApp()

        let masterElementsQuery = XCUIApplication().scrollViews.otherElements.containing(.image, identifier: "master")

        XCTAssertTrue(masterElementsQuery.firstMatch.waitForExistence(timeout: 0.5))
    }

    func launchApp() {
        app.launch()
        app.tap()
    }
}
