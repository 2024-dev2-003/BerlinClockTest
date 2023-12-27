//
//  BerlinClockEngineTests.swift
//  BerlinClockTestTests
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import XCTest
@testable import BerlinClockTest

final class BerlinClockEngineTests: XCTestCase {

    private let clockEngine: BerlinClockEngineProtocol = BerlinClockEngine(useCase: LightStateUseCase())

    // Second lamp

    func test_oneSecondLamp_expectedResult() {

        // odd

        XCTAssert(clockEngine.clock(for: Date.createWith(second: 1)).second == .off)
        XCTAssert(clockEngine.clock(for: Date.createWith(second: 3)).second  == .off)

        // even

        XCTAssert(clockEngine.clock(for: Date.createWith(second: 0)).second == .yellow)
        XCTAssert(clockEngine.clock(for: Date.createWith(second: 2)).second  == .yellow)

        // Should never happen

        XCTAssertFalse(clockEngine.clock(for: Date.createWith(second: 0)).second  == .red)
        XCTAssertFalse(clockEngine.clock(for: Date.createWith(second: 1)).second  == .red)
    }

    // Five hours row

    func test_fiveHoursRowLamp_expectedResult() {
        checkFiveHoursSatisfy(with: 0...4, expectedResult: "OOOO")
        checkFiveHoursSatisfy(with: 5...9, expectedResult: "ROOO")
        checkFiveHoursSatisfy(with: 10...14, expectedResult: "RROO")
        checkFiveHoursSatisfy(with: 15...19, expectedResult: "RRRO")
        checkFiveHoursSatisfy(with: 20...23, expectedResult: "RRRR")
    }

    func checkFiveHoursSatisfy(with hours: ClosedRange<Int>, expectedResult: String) {
        let results = hours.map { clockEngine.clock(for: Date.createWith(hour: $0)).fiveHours.colorsOfTheRow }
        XCTAssert(results.allSatisfy { $0 == expectedResult })
    }

    // Hour row

    func test_oneHourLamp_expectedResult() {
        checkOneHourSatisfy(with: [0, 5, 10, 15, 20], expectedResult: "OOOO")
        checkOneHourSatisfy(with: [1, 6, 11, 16, 21], expectedResult: "ROOO")
        checkOneHourSatisfy(with: [2, 7, 12, 17, 22], expectedResult: "RROO")
        checkOneHourSatisfy(with: [3, 8, 13, 18, 23], expectedResult: "RRRO")
        checkOneHourSatisfy(with: [4, 9, 14, 19], expectedResult: "RRRR")
    }

    func checkOneHourSatisfy(with hours: [Int], expectedResult: String) {
        let results = hours.map { clockEngine.clock(for: Date.createWith(hour: $0)).hours.colorsOfTheRow }
        XCTAssert(results.allSatisfy { $0 == expectedResult })
    }

    // 5 minutes row

    func test_fiveMinutesRowLight_expectedResult() {
        checkFiveMinutesSatisfy(with: 0...4, expectedResult: "OOOOOOOOOOO")
        checkFiveMinutesSatisfy(with: 5...9, expectedResult: "YOOOOOOOOOO")
        checkFiveMinutesSatisfy(with: 10...14, expectedResult: "YYOOOOOOOOO")
        checkFiveMinutesSatisfy(with: 15...19, expectedResult: "YYROOOOOOOO")
        checkFiveMinutesSatisfy(with: 20...24, expectedResult: "YYRYOOOOOOO")
        checkFiveMinutesSatisfy(with: 25...29, expectedResult: "YYRYYOOOOOO")
        checkFiveMinutesSatisfy(with: 30...34, expectedResult: "YYRYYROOOOO")
        checkFiveMinutesSatisfy(with: 35...39, expectedResult: "YYRYYRYOOOO")
        checkFiveMinutesSatisfy(with: 40...44, expectedResult: "YYRYYRYYOOO")
        checkFiveMinutesSatisfy(with: 45...49, expectedResult: "YYRYYRYYROO")
        checkFiveMinutesSatisfy(with: 50...54, expectedResult: "YYRYYRYYRYO")
        checkFiveMinutesSatisfy(with: 55...59, expectedResult: "YYRYYRYYRYY")
    }

    func checkFiveMinutesSatisfy(with minutes: ClosedRange<Int>, expectedResult: String) {
        let results = minutes.map { clockEngine.clock(for: Date.createWith(minute: $0)).fiveMinutes.colorsOfTheRow }

        XCTAssert(results.allSatisfy { $0 == expectedResult })
    }
}
