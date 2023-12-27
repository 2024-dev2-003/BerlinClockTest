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

    func startTimer()
    func stopTimer()
}

public class BerlinClockViewModel: BerlinClockViewModelProtocol {

    private let clockEngine: BerlinClockEngineProtocol
    private let timerManager: TimerManagerProtocol

    private var cancellables = Set<AnyCancellable>()

    public func startTimer() {
        timerManager.start()
    }

    public func stopTimer() {
        timerManager.stop()
    }

    // Publisher
    @Published private var berlinClock: BerlinClock
    public var berlinClockPublisher: Published<BerlinClock>.Publisher { $berlinClock }

    public init(clockEngine: BerlinClockEngineProtocol, timerManager: TimerManagerProtocol) {
        self.clockEngine = clockEngine
        self.timerManager = timerManager

        self.berlinClock = clockEngine.clock(for: Date.createWith(hour: 0,
                                                                  minute: 0,
                                                                  second: 1))

        timerManager.currentDatePublisher
            .sink { date in
                // Refresh
            }
            .store(in: &cancellables)
    }


}

