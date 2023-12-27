//
//  Calendar+Extension.swift
//  BerlinClockTest
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import Foundation

public extension Calendar {
    func seconds(of date: Date) -> Int {
        component(.second, from: date)
    }

    func hours(of date: Date) -> Int {
        component(.hour, from: date)
    }
}
