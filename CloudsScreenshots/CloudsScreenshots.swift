//
//  CloudsScreenshots.swift
//  CloudsScreenshots
//
//  Created by Lukas Romsicki on 2020-04-30.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CoreLocation
import XCTest

class CloudsScreenshots: XCTestCase {
    var app: XCUIApplication!

    let stubs = DynamicStubs()

    override func setUpWithError() throws {
        super.setUp()

        continueAfterFailure = false

        app = XCUIApplication()
        app.launchArguments += ["UI_TESTING"]

        try! stubs.server.start()

        setupSnapshot(app)
    }

    override func tearDownWithError() throws {
        app = nil
        stubs.server.stop()
        super.tearDown()
    }

    func testNow() throws {
        stubs.stubRequest(path: "/graphql", jsonData: WeatherFixtureJSON().jsonData!)
        app.launch()

        app.textFields["omnibar"].tap()
        app.scrollViews.buttons.matching(identifier: "locationpicker.item").element(boundBy: 0).tap()

        snapshot("01Now")
    }

    func testDetails() throws {
        stubs.stubRequest(path: "/graphql", jsonData: WeatherFixtureJSON().jsonData!)
        app.launch()

        app.scrollViews.otherElements["master"].swipeUp()
        snapshot("02NowDetails")

        app.scrollViews.otherElements["master"].swipeDown()
    }

    func testAlerts() throws {
        stubs.stubRequest(path: "/graphql", jsonData: WeatherFixtureJSON().jsonData!)
        app.launch()

        app.buttons["navigationbar.alertstack.indicator"].firstMatch.tap()
        snapshot("03Alerts")

        app.buttons["alertlist.close"].tap()
    }

    func testWeek() throws {
        stubs.stubRequest(path: "/graphql", jsonData: WeatherFixtureJSON().jsonData!)
        app.launch()

        app.textFields["omnibar"].tap()
        app.scrollViews.buttons.matching(identifier: "locationpicker.item").element(boundBy: 1).tap()
        app.scrollViews.buttons.matching(identifier: "navigationbar.button").element(boundBy: 1).tap(after: 2, in: self)
        app.scrollViews.buttons.matching(identifier: "week.daypicker.datebubble").element(boundBy: 2).tap()
        snapshot("04Week")
    }

    func testRadar() throws {
        stubs.stubRequest(path: "/graphql", jsonData: WeatherFixtureJSON().jsonData!)
        app.launch()

        app.textFields["omnibar"].tap()
        app.scrollViews.buttons.matching(identifier: "locationpicker.item").element(boundBy: 3).tap()
        app.scrollViews.buttons.matching(identifier: "navigationbar.button").element(boundBy: 2).tap(after: 2, in: self)
        snapshot("05Radar")
    }

    func testLocationPicker() throws {
        stubs.stubRequest(path: "/graphql", jsonData: WeatherFixtureJSON().jsonData!)
        app.launch()

        app.textFields["omnibar"].tap()
        snapshot("06LocationPicker")
    }
}

extension XCUIElement {
    func tap(after delay: TimeInterval, in testCase: XCTestCase) {
        let predicate = NSPredicate(format: "isHittable == 1")
        testCase.expectation(for: predicate, evaluatedWith: self, handler: nil)
        testCase.waitForExpectations(timeout: 10, handler: nil)
        tap()
    }
}
