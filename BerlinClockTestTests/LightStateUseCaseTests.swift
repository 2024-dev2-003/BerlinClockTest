//
//  LightStateUseCaseTests.swift
//  BerlinClockTestTests
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import XCTest
@testable import BerlinClockTest

final class LightStateUseCaseTests: XCTestCase {

    private let useCase: LightStateUseCaseProtocol = LightStateUseCase()

    // Second light

    func test_oneSecondLight_expectedResult() {

        // odd

        XCTAssertFalse(useCase.secondState(from: Date.createWith(second: 1)))
        XCTAssertFalse(useCase.secondState(from: Date.createWith(second: 3)))

        // even

        XCTAssertTrue(useCase.secondState(from: Date.createWith(second: 0)))
        XCTAssertTrue(useCase.secondState(from: Date.createWith(second: 2)))
    }

    // Five hours row

    func test_fiveHoursRowLight_expectedResult() {
        checkFiveHoursSatisfy(with: 0...4, expectedResult: generateExpectedResult(numberLights: 4, totalLightsOn: 0))
        checkFiveHoursSatisfy(with: 5...9, expectedResult: generateExpectedResult(numberLights: 4, totalLightsOn: 1))
        checkFiveHoursSatisfy(with: 10...14, expectedResult: generateExpectedResult(numberLights: 4, totalLightsOn: 2))
        checkFiveHoursSatisfy(with: 15...19, expectedResult: generateExpectedResult(numberLights: 4, totalLightsOn: 3))
        checkFiveHoursSatisfy(with: 20...23, expectedResult: generateExpectedResult(numberLights: 4, totalLightsOn: 4))
    }

    func checkFiveHoursSatisfy(with hours: ClosedRange<Int>, expectedResult: [Bool]) {
        let results = hours.map { useCase.fiveHoursRowStates(from: Date.createWith(hour: $0)) }
        XCTAssert(results.allSatisfy { $0 == expectedResult })
    }

    // One hour row

    func test_oneHourRowLight_expectedResult() {
        checkOneHourSatisfy(with: [0, 5, 10, 15, 20], expectedResult: generateExpectedResult(numberLights: 4, totalLightsOn: 0))
        checkOneHourSatisfy(with: [1, 6, 11, 16, 21], expectedResult: generateExpectedResult(numberLights: 4, totalLightsOn: 1))
        checkOneHourSatisfy(with: [2, 7, 12, 17, 22], expectedResult: generateExpectedResult(numberLights: 4, totalLightsOn: 2))
        checkOneHourSatisfy(with: [3, 8, 13, 18, 23], expectedResult: generateExpectedResult(numberLights: 4, totalLightsOn: 3))
        checkOneHourSatisfy(with: [4, 9, 14, 19], expectedResult: generateExpectedResult(numberLights: 4, totalLightsOn: 4))
    }

    func checkOneHourSatisfy(with hours: [Int], expectedResult: [Bool]) {
        let results = hours.map { useCase.oneHourRowStates(from: Date.createWith(hour: $0)) }
        XCTAssert(results.allSatisfy { $0 == expectedResult })
    }

    // Five minutes row

    func test_fiveMinutesRowLight_expectedResult() {
        checkFiveMinutesSatisfy(with: 0...4, expectedResult: generateExpectedResult(numberLights: 11, totalLightsOn: 0))
        checkFiveMinutesSatisfy(with: 5...9, expectedResult: generateExpectedResult(numberLights: 11, totalLightsOn: 1))
        checkFiveMinutesSatisfy(with: 10...14, expectedResult: generateExpectedResult(numberLights: 11, totalLightsOn: 2))
        checkFiveMinutesSatisfy(with: 15...19, expectedResult: generateExpectedResult(numberLights: 11, totalLightsOn: 3))
        checkFiveMinutesSatisfy(with: 20...24, expectedResult: generateExpectedResult(numberLights: 11, totalLightsOn: 4))
        checkFiveMinutesSatisfy(with: 25...29, expectedResult: generateExpectedResult(numberLights: 11, totalLightsOn: 5))
        checkFiveMinutesSatisfy(with: 30...34, expectedResult: generateExpectedResult(numberLights: 11, totalLightsOn: 6))
        checkFiveMinutesSatisfy(with: 35...39, expectedResult: generateExpectedResult(numberLights: 11, totalLightsOn: 7))
        checkFiveMinutesSatisfy(with: 40...44, expectedResult: generateExpectedResult(numberLights: 11, totalLightsOn: 8))
        checkFiveMinutesSatisfy(with: 45...49, expectedResult: generateExpectedResult(numberLights: 11, totalLightsOn: 9))
        checkFiveMinutesSatisfy(with: 50...54, expectedResult: generateExpectedResult(numberLights: 11, totalLightsOn: 10))
        checkFiveMinutesSatisfy(with: 55...59, expectedResult: generateExpectedResult(numberLights: 11, totalLightsOn: 11))
    }

    func checkFiveMinutesSatisfy(with minutes: ClosedRange<Int>, expectedResult: [Bool]) {
        let results = minutes.map { useCase.fiveMinutesRowStates(from: Date.createWith(minute: $0)) }

        XCTAssert(results.allSatisfy { $0 == expectedResult })
    }

    // One minute row

    func test_oneMinuteRowLight_expectedResult() {
        checkOneMinuteSatisfy(with: [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55],
                              expectedResult: generateExpectedResult(numberLights: 4, totalLightsOn: 0))

        checkOneMinuteSatisfy(with: [1, 6, 11, 16, 21, 26, 31, 36, 41, 46, 51, 56],
                              expectedResult: generateExpectedResult(numberLights: 4, totalLightsOn: 1))

        checkOneMinuteSatisfy(with: [2, 7, 12, 17, 22, 27, 32, 37, 42, 47, 52, 57],
                              expectedResult: generateExpectedResult(numberLights: 4, totalLightsOn: 2))

        checkOneMinuteSatisfy(with: [3, 8, 13, 18, 23, 28, 33, 38, 43, 48, 53, 58],
                              expectedResult: generateExpectedResult(numberLights: 4, totalLightsOn: 3))

        checkOneMinuteSatisfy(with: [4, 9, 14, 19, 24, 29, 34, 39, 44, 49, 54, 59],
                              expectedResult: generateExpectedResult(numberLights: 4, totalLightsOn: 4))
    }

    func checkOneMinuteSatisfy(with minutes: [Int], expectedResult: [Bool]) {
        let results = minutes.map { useCase.oneMinuteRowStates(from: Date.createWith(minute: $0)) }

        XCTAssert(results.allSatisfy { $0 == expectedResult })
    }


    // Utils

    func generateExpectedResult(numberLights: Int, totalLightsOn: Int) -> [Bool] {
        Array(repeating: true, count: totalLightsOn) + Array(repeating: false, count: numberLights - totalLightsOn)
    }
}

