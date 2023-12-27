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

    public func clock(for date: Date) -> BerlinClock {
        return BerlinClock(second: .off, fiveHours: [], hours: [], fiveMinutes: [], minutes: [])
    }
}
