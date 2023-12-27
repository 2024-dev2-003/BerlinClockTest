//
//  BerlinClockTestUITests.swift
//  BerlinClockTestUITests
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import XCTest

final class BerlinClockTestUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func test_berlinClock_initialUI_expected() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssert(app.otherElements["secondLamp"].exists, "secondLamp should exist")
        XCTAssert(app.otherElements["fiveHoursRowLamp"].exists, "fiveHoursRowLamp should exist")
        XCTAssert(app.otherElements["hoursRowLamp"].exists, "hoursRowLamp should exist")
        XCTAssert(app.otherElements["fiveMinutesRowLamp"].exists, "fiveMinutesRowLamp should exist")
        XCTAssert(app.otherElements["minutesRowLamp"].exists, "minutesRowLamp should exist")
        XCTAssert(app.staticTexts["timeLabel"].exists, "timeLabel should exist")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
