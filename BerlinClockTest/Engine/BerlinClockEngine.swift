//
//  BerlinClockEngine.swift
//  BerlinClockTest
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import Foundation

public protocol BerlinClockEngineProtocol {
    func clock(for date: Date) -> BerlinClock
}

public class BerlinClockEngine: BerlinClockEngineProtocol {

    private let useCase: LightStateUseCaseProtocol

    public init(useCase: LightStateUseCaseProtocol) {
        self.useCase = useCase
    }

    public func clock(for date: Date) -> BerlinClock {
        BerlinClock(second: secondLamp(with: date),
                    fiveHours: hourLamps(with: useCase.fiveHoursRowStates(from: date)),
                    hours: [],
                    fiveMinutes: [],
                    minutes: [])
    }

    private func secondLamp(with date: Date) -> Lamp {
        useCase.secondState(from: date) ? .yellow : .off
    }

    private func hourLamps(with states: [Bool]) -> [Lamp] {
        states.map { $0 ? .red : .off  }
    }
}
