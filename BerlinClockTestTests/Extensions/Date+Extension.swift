//
//  Date+Extension.swift
//  BerlinClockTestTests
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import Foundation

public extension Date {
    static func createWith(calendar: Calendar = .init(identifier: .gregorian),
                           hour: Int = 0,
                           minute: Int = 0,
                           second: Int = 0) -> Self {

        calendar.date(bySettingHour: hour,
                      minute: minute,
                      second: second,
                      of: Date())!
    }
}
