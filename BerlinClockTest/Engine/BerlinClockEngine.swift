//
//  BerlinClockEngine.swift
//  BerlinClockTest
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import Foundation

/// This Engine generates us a BerlinClock object each time we provide a date.
/// It can also generate a clock that is completely off.
public protocol BerlinClockEngineProtocol {
    var clockOff: BerlinClock { get }

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
                    hours: hourLamps(with: useCase.oneHourRowStates(from: date)),
                    fiveMinutes: minuteLamps(with: useCase.fiveMinutesRowStates(from: date),
                                             withVisualMarkAtInterval: 3),
                    minutes: minuteLamps(with: useCase.oneMinuteRowStates(from: date)),
                    time: DateFormatter.hoursMinutesSecondsFormatter.string(from: date))
    }


    public var clockOff: BerlinClock {
        let date = Date.createWith(hour: 0,
                                   minute: 0,
                                   second: 1)

        return BerlinClock(second: secondLamp(with: date),
                           fiveHours: hourLamps(with: useCase.fiveHoursRowStates(from: date)),
                           hours: hourLamps(with: useCase.oneHourRowStates(from: date)),
                           fiveMinutes: minuteLamps(with: useCase.fiveMinutesRowStates(from: date),
                                                    withVisualMarkAtInterval: 3),
                           minutes: minuteLamps(with: useCase.oneMinuteRowStates(from: date)),
                           time: "--:--")
    }


    private func secondLamp(with date: Date) -> Lamp {
        useCase.secondState(from: date) ? .yellow : .off
    }

    private func hourLamps(with states: [Bool]) -> [Lamp] {
        states.map { $0 ? .red : .off  }
    }

    private func minuteLamps(with states: [Bool], withVisualMarkAtInterval: Int = 0) -> [Lamp] {
        states.enumerated().map { (index, element) in
            guard element else { return .off } // Check first if it is light on
            guard withVisualMarkAtInterval > 0 else { return .yellow } // Check if we need visualMark logic, if not it's simply yellow

            let tmpIndex = index + 1
            return tmpIndex % withVisualMarkAtInterval == 0 ? .red : .yellow
        }
    }
}
