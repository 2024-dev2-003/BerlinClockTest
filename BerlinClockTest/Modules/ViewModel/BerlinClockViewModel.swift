//
//  BerlinClockViewModel.swift
//  BerlinClockTest
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import Combine
import Foundation

public protocol BerlinClockViewModelProtocol {
    var berlinClockPublisher: Published<BerlinClock>.Publisher { get }
}

public class BerlinClockViewModel: BerlinClockViewModelProtocol {

    private let clockEngine: BerlinClockEngineProtocol

    // Publisher
    @Published private var berlinClock: BerlinClock
    public var berlinClockPublisher: Published<BerlinClock>.Publisher { $berlinClock }

    public init(clockEngine: BerlinClockEngineProtocol) {
        self.clockEngine = clockEngine

        self.berlinClock = clockEngine.clock(for: Date.createWith(hour: 0,
                                                                  minute: 0,
                                                                  second: 1))

    }


}

