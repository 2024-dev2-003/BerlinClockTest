//
//  TimeManagerMock.swift
//  BerlinClockTestTests
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import Combine
import Foundation

@testable import BerlinClockTest

class TimerManagerMock: TimerManagerProtocol {
    var currentDatePublisher: Published<Date>.Publisher { $currentDate }
    @Published private var currentDate: Date = Date.createWith(hour: 1,
                                                               minute: 1,
                                                               second: 1)

    func start() {
        currentDate.addOneSecond()
    }

    func stop() {
        //
    }
}
