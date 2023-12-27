//
//  Array+Extension.swift
//  BerlinClockTestTests
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

@testable import BerlinClockTest

extension Array where Element == Lamp {
    var colorsOfTheRow: String {
        map { lamp in lamp.rawValue }.joined()
    }
}
