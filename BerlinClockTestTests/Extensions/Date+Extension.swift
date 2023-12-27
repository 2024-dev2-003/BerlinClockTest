//
//  Date+Extension.swift
//  BerlinClockTestTests
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import Foundation

public extension Date {
    mutating func addOneSecond() {
        let calendar: Calendar = Calendar(identifier: .gregorian)
        guard let date = calendar.date(byAdding: .second, value: 1, to: self) else { return }
        self = date
    }
}
