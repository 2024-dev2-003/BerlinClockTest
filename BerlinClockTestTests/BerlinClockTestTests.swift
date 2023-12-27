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


    // Utils

    func generateExpectedResult(numberLights: Int, totalLightsOn: Int) -> [Bool] {
        Array(repeating: true, count: totalLightsOn) + Array(repeating: false, count: numberLights - totalLightsOn)
    }
}

