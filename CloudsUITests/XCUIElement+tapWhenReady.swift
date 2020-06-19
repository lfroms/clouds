//
//  XCUIElement+tapWhenReady.swift
//  CloudsUITests
//
//  Created by Lukas Romsicki on 2020-06-18.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import XCTest

extension XCUIElement {
    func tapWhenReady(in testCase: XCTestCase) {
        let predicate = NSPredicate(format: "isHittable == 1")
        testCase.expectation(for: predicate, evaluatedWith: self, handler: nil)
        testCase.waitForExpectations(timeout: 10, handler: nil)
        tap()
    }
}
