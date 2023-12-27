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


}
