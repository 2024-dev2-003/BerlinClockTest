//
//  BerlinClockViewModelTests.swift
//  BerlinClockTestTests
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import XCTest

@testable import BerlinClockTest

final class BerlinClockViewModelTests: XCTestCase {

    var viewModel: BerlinClockViewModelProtocol!
    var timerManager: TimerManagerProtocol!

    var clockEngine: BerlinClockEngineProtocol = BerlinClockEngine(useCase: LightStateUseCase())

    override func setUp() {
        super.setUp()
        self.timerManager = TimerManager()
        self.viewModel = BerlinClockViewModel(clockEngine: clockEngine, timerManager: timerManager)
    }

    override func tearDown() {
        super.tearDown()
        self.viewModel = nil
    }

    func test_berlinClock_initialState_expectedResult() {
        let expectation = expectation(description: "Waiting for initial BerlinClock value to publish")

        let cancellable = viewModel.berlinClockPublisher.sink { clock in

            // Verify if the clock is off at beginning
            XCTAssert(clock.second.rawValue == "O")
            XCTAssert(clock.fiveHours.colorsOfTheRow == "OOOO")
            XCTAssert(clock.hours.colorsOfTheRow == "OOOO")
            XCTAssert(clock.fiveMinutes.colorsOfTheRow == "OOOOOOOOOOO")
            XCTAssert(clock.minutes.colorsOfTheRow == "OOOO")

            expectation.fulfill()
        }

        waitForExpectations(timeout: 10) { error in
            cancellable.cancel()
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }

}

