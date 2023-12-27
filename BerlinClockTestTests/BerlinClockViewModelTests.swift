//
//  BerlinClockViewModelTests.swift
//  BerlinClockTestTests
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import XCTest

@testable import BerlinClockTest

final class BerlinClockViewModelTests: XCTestCase {

    var viewModel: BerlinClockViewModel!
    var timerManager: TimerManagerProtocol!

    var clockEngine: BerlinClockEngineProtocol = BerlinClockEngine(useCase: LightStateUseCase())

    override func setUp() {
        super.setUp()
        self.timerManager = TimerManagerMock()
        self.viewModel = BerlinClockViewModel(clockEngine: clockEngine, timerManager: timerManager)
    }

    override func tearDown() {
        super.tearDown()
        self.viewModel = nil
    }

    func test_berlinClock_initialState_expectedResult() {
        let expectation = expectation(description: "Waiting for initial BerlinClock value to publish")

        let cancellable = viewModel.berlinClockPublisher
            .first() // We want to verify only the initial value
            .sink { clock in

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

    func test_berlinClock_tickingOneSecond_expectedResult() {
        let expectation = expectation(description: "Waiting for  BerlinClock to tick to the next second")

        let cancellable = viewModel.berlinClockPublisher
            .dropFirst() // We don't want to verify the initial value
            .sink { clock in

            // Verify if the clock is ticking
            XCTAssert(clock.second.rawValue == "Y") // second goes to 2 seconds, if success it means the clock is ticking
            XCTAssert(clock.fiveHours.colorsOfTheRow == "OOOO")
            XCTAssert(clock.hours.colorsOfTheRow == "ROOO")
            XCTAssert(clock.fiveMinutes.colorsOfTheRow == "OOOOOOOOOOO")
            XCTAssert(clock.minutes.colorsOfTheRow == "YOOO")

            expectation.fulfill()
        }

        timerManager.start() // Make the clock ticking

        waitForExpectations(timeout: 10) { error in
            cancellable.cancel()
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
}
