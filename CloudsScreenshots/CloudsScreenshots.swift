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

    func testNow() throws {
        stubs.stubRequest(path: "/graphql", jsonData: WeatherFixtureJSON().jsonData!)
        launchApp()

        app.textFields["omnibar"].tapWhenReady(in: self)
        app.scrollViews.buttons.matching(identifier: "locationpicker.item").element(boundBy: 0).tapWhenReady(in: self)

        snapshot("01Now")
    }

    func testDetails() throws {
        stubs.stubRequest(path: "/graphql", jsonData: WeatherFixtureJSON().jsonData!)
        launchApp()

        app.scrollViews.otherElements["master"].swipeUp()
        snapshot("02NowDetails")

        app.scrollViews.otherElements["master"].swipeDown()
    }

    func testAlertList() throws {
        stubs.stubRequest(path: "/graphql", jsonData: WeatherFixtureJSON().jsonData!)
        launchApp()

        app.buttons.matching(identifier: "navigationbar.alertstack.indicator").element(boundBy: 0).tapWhenReady(in: self)
        snapshot("03Alerts")

        app.buttons.matching(identifier: "alertlist.close").element(boundBy: 0).tapWhenReady(in: self)
    }

    func testWeek() throws {
        stubs.stubRequest(path: "/graphql", jsonData: WeatherFixtureJSON().jsonData!)
        launchApp()

        app.textFields["omnibar"].tapWhenReady(in: self)
        app.scrollViews.buttons.matching(identifier: "locationpicker.item").element(boundBy: 1).tapWhenReady(in: self)
        app.scrollViews.buttons.matching(identifier: "navigationbar.button").element(boundBy: 1).tapWhenReady(in: self)
        app.scrollViews.buttons.matching(identifier: "week.daypicker.datebubble").element(boundBy: 0).tapWhenReady(in: self)
        snapshot("04Week")
    }

    func testRadar() throws {
        stubs.stubRequest(path: "/graphql", jsonData: WeatherFixtureJSON().jsonData!)
        launchApp()

        app.textFields["omnibar"].tapWhenReady(in: self)
        app.scrollViews.buttons.matching(identifier: "locationpicker.item").element(boundBy: 0).tapWhenReady(in: self)

        sleep(UInt32(2))

        stubs.stubRequest(path: "/graphql", jsonData: RadarFixtureJSON().jsonData!)

        app.scrollViews.buttons.matching(identifier: "navigationbar.button").element(boundBy: 2).tapWhenReady(in: self)

        sleep(UInt32(10))

        snapshot("05Radar")
    }

    func testLocationPicker() throws {
        stubs.stubRandomWeatherResponse()
        launchApp()

        app.textFields["omnibar"].tapWhenReady(in: self)
        snapshot("06LocationPicker")
    }

    func launchApp() {
        app.launch()
        app.tap()
    }
}

extension XCUIElement {
    func tapWhenReady(in testCase: XCTestCase) {
        let predicate = NSPredicate(format: "isHittable == 1")
        testCase.expectation(for: predicate, evaluatedWith: self, handler: nil)
        testCase.waitForExpectations(timeout: 10, handler: nil)
        tap()
    }
}
