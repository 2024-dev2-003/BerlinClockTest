//
//  Lamp.swift
//  BerlinClockTest
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import SwiftUI

public enum Lamp: String {
    case off = "O", yellow = "Y", red = "R"

    public var color: Color {
        switch self {
        case .off: .clear
        case .yellow: .yellow
        case .red: .red
        }
    }
}
