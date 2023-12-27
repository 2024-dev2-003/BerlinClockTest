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
    func oneHourRowStates(from date: Date) -> [Bool]
    func fiveMinutesRowStates(from date: Date) -> [Bool]
    func oneMinuteRowStates(from date: Date) -> [Bool]
}

public class LightStateUseCase: LightStateUseCaseProtocol {

    private var calendar: Calendar = .init(identifier: .gregorian)

    public func secondState(from date: Date) -> Bool {
        calendar.seconds(of: date) % 2 == 0
    }

    public func fiveHoursRowStates(from date: Date) -> [Bool] {
        generateStates(for: 4, isOnTotal: calendar.hours(of: date) / 5)
    }

    public func oneHourRowStates(from date: Date) -> [Bool] {
        generateStates(for: 4, isOnTotal: calendar.hours(of: date) % 5)
    }

    public func fiveMinutesRowStates(from date: Date) -> [Bool] {
        generateStates(for: 11, isOnTotal: calendar.minutes(of: date) / 5)
    }

    public func oneMinuteRowStates(from date: Date) -> [Bool] {
        generateStates(for: 4, isOnTotal: calendar.minutes(of: date) % 5)
    }

    // Utils

    private func generateStates(for numberOfLights: Int, isOnTotal: Int) -> [Bool] {
        Array(repeating: true, count: isOnTotal) + Array(repeating: false, count: numberOfLights - isOnTotal)
    }

}
