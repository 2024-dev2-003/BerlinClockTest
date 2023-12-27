//
//  LightStateUseCase.swift
//  BerlinClockTest
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import Foundation

public protocol LightStateUseCaseProtocol {
    func secondState(from date: Date) -> Bool
}

public class LightStateUseCase: LightStateUseCaseProtocol {

    public func secondState(from date: Date) -> Bool {
        false
    }
}
