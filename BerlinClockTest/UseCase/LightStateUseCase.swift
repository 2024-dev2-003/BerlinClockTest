//
//  LightStateUseCase.swift
//  BerlinClockTest
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import Foundation

public protocol LightStateUseCaseProtocol {
    func secondState(from date: Date) -> Bool
    func fiveHoursRowStates(from date: Date) -> [Bool]
}

public class LightStateUseCase: LightStateUseCaseProtocol {

    private var calendar: Calendar = .init(identifier: .gregorian)

    public func secondState(from date: Date) -> Bool {
        calendar.seconds(of: date) % 2 == 0
    }

    public func fiveHoursRowStates(from date: Date) -> [Bool] {
        []
    }
}
