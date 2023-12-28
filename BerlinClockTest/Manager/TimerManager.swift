//
//  TimerManager.swift
//  BerlinClockTest
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import Combine
import Foundation

/// Simple timer that notifies us each second of the new actual date.
/// Also we can start and stop the timer that is ticking.
public protocol TimerManagerProtocol {
    var currentDatePublisher: Published<Date>.Publisher { get }

    func start()
    func stop()
}

public class TimerManager: TimerManagerProtocol {

    // Publisher
    @Published private var currentDate: Date = Date()
    public var currentDatePublisher: Published<Date>.Publisher { $currentDate }

    private var timer: Timer?


    public func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1,
                                     repeats: true) { [weak self] _ in
            self?.currentDate = Date()
        }
    }

    public func stop() {
        guard let timer = timer else { return }

        timer.invalidate()
    }
}
