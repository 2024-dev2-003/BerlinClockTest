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

    func test_oneSecondLight_expectedResult() {

        // odd

        XCTAssertFalse(useCase.secondState(from: Date.createWith(second: 1)))
        XCTAssertFalse(useCase.secondState(from: Date.createWith(second: 3)))

        // even

        XCTAssertTrue(useCase.secondState(from: Date.createWith(second: 0)))
        XCTAssertTrue(useCase.secondState(from: Date.createWith(second: 2)))
    }

}

